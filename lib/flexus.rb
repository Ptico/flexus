require 'set'
require 'forwardable'

# The Flexus transforms words from singular to plural, class names to table names, modularized class names to ones without,
# and class names to foreign keys. The default inflections for pluralization, singularization, and uncountable words are kept
# in inflections.rb.
#
# The Rails core team has stated patches for the inflections library will not be accepted
# in order to avoid breaking legacy applications which may be relying on errant inflections.
# If you discover an incorrect inflection and require it for your application, you'll need
# to correct it yourself (explained below).
class Flexus
  extend SingleForwardable

  def_single_delegators :instance,
    :camelize, :underscore, :dasherize,
    :demodulize, :foreign_key, :constantize,
    :ordinalize, :inflections, :pluralize,
    :singularize, :humanize, :tableize,
    :classify, :uncountable?, :underscorize

  def self.instance
    @__instance__ ||= new.load_defaults
  end

  attr_reader :inflections_instance

  def initialize
    @inflections_instance = Inflections.new
  end

  # Convert input to UpperCamelCase
  #
  # Will also convert '/' to '::' which is useful for converting paths to namespaces.
  #
  # @param [String] input
  #
  # @example
  #   Flexus.camelize("data_mapper")        # => "DataMapper"
  #   Flexus.camelize("data_mapper/errors") # => "DataMapper::Errors"
  #
  # @return [String]
  #
  # @api public
  #
  def camelize(input)
    input.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:\A|_)(.)/) { $1.upcase }
  end

  # Convert input to underscored, lowercase string
  #
  # Changes '::' to '/' to convert namespaces to paths.
  #
  # @param [String] input
  #
  # @example
  #   Flexus.underscore("DataMapper")         # => "data_mapper"
  #   Flexus.underscore("DataMapper::Errors") # => "data_mapper/errors"
  #
  # @return [String]
  #
  # @api public
  #
  def underscore(input)
    word = input.gsub(/::/, '/')
    underscorize(word)
  end

  # Convert input underscores to dashes
  #
  # @param [String] input
  #
  # @example
  #   Flexus.dasherize("foo_bar") # => "foo-bar"
  #
  # @return [String]
  #
  # @api public
  #
  def dasherize(input)
    input.tr('_', '-')
  end

  # Return unscoped constant name
  #
  # @param [String] input
  #
  # @example
  #
  #   Flexus.demodulize("DataMapper::Error") # => "Error"
  #   Flexus.demodulize("DataMapper")        # => "DataMapper"
  #
  # @return [String]
  #
  # @api public
  #
  def demodulize(input)
    input.split('::').last
  end

  # Creates a foreign key name
  #
  # @param [String] input
  #
  # @example
  #
  #   Flexus.foreign_key("Message") => "message_id"
  #
  # @return [String]
  #
  # @api public
  #
  def foreign_key(input)
    "#{underscorize(demodulize(input))}_id"
  end

  # Find a constant with the name specified in the argument string
  #
  # The name is assumed to be the one of a top-level constant, constant scope of caller is ignored
  #
  # @param [String] input
  #
  # @example
  #
  #   Flexus.constantize("Module")            # => Module
  #   Flexus.constantize("DataMapper::Error") # => DataMapper::Error
  #
  # @return [Class, Module]
  #
  # @api public
  #
  def constantize(input)
    names = input.split('::')
    names.shift if names.first.empty?

    names.inject(Object) do |constant, name|
      if constant.const_defined?(name, false)
        constant.const_get(name)
      else
        constant.const_missing(name)
      end
    end
  end

  ORDINALIZE_TH = (4..16).to_set.freeze

  # Convert a number into an ordinal string
  #
  # @param [Fixnum] number
  #
  # @example
  #
  #   ordinalize(1)     # => "1st"
  #   ordinalize(2)     # => "2nd"
  #   ordinalize(1002)  # => "1002nd"
  #   ordinalize(1003)  # => "1003rd"
  #
  # @return [String]
  #
  # @api public
  #
  def ordinalize(number)
    abs_value = number.abs

    if ORDINALIZE_TH.include?(abs_value % 100)
      "#{number}th"
    else
      case abs_value % 10
        when 1; "#{number}st"
        when 2; "#{number}nd"
        when 3; "#{number}rd"
      end
    end
  end

  # Yields a singleton instance of Flexus::Inflections
  #
  # @example
  #
  #   Flexus.inflections do |inflect|
  #     inflect.uncountable "rails"
  #   end
  #
  # @return [Flexus::Inflections]
  #
  # @api public
  #
  def inflections
    block_given? ? yield(inflections_instance) : inflections_instance
  end

  # Convert input word string to plural
  #
  # @param [String] word
  #
  # @example
  #
  #   Flexus.pluralize("post")         # => "posts"
  #   Flexus.pluralize("octopus")      # => "octopi"
  #   Flexus.pluralize("sheep")        # => "sheep"
  #   Flexus.pluralize("words")        # => "words"
  #   Flexus.pluralize("CamelOctopus") # => "CamelOctopi"
  #
  # @return [String]
  #
  # @api public
  #
  def pluralize(word)
    return word if uncountable?(word)
    inflections.plurals.apply_to(word)
  end

  # Convert word to singular
  #
  # @param [String] word
  #
  # @example
  #
  #   Flexus.singularize("posts") # => "post"
  #   Flexus.singularize("octopi") # => "octopus"
  #   Flexus.singularize("sheep") # => "sheep"
  #   Flexus.singularize("word") # => "word"
  #   Flexus.singularize("CamelOctopi") # => "CamelOctopus"
  #
  # @return [String]
  #
  # @api public
  #
  def singularize(word)
    return word if uncountable?(word)
    inflections.singulars.apply_to(word)
  end

  # Humanize string
  #
  # @param [String] input
  #
  # capitalizes the first word and turns underscores into spaces and strips a # trailing "_id", if any.
  # Like +titleize+, this is meant for creating pretty output.
  #
  # @example
  #
  #   Flexus.humanize("employee_salary") # => "Employee salary"
  #   Flexus.humanize("author_id")       # => "Author"
  #
  # @return [String]
  #
  # @api public
  #
  def humanize(input)
    result = inflections.humans.apply_to(input)
    result.gsub!(/_id\z/, "")
    result.tr!('_', " ")
    result.capitalize!
    result
  end

  # Tabelize input string
  #
  # @param [String] input
  #
  # Create the name of a table like Rails does for models to table names.
  # This method # uses the +pluralize+ method on the last word in the string.
  #
  # @example
  #
  #   Flexus.tableize("RawScaledScorer") # => "raw_scaled_scorers"
  #   Flexus.tableize("egg_and_ham")     # => "egg_and_hams"
  #   Flexus.tableize("fancyCategory")   # => "fancy_categories"
  #
  # @return [String]
  #
  # @api public
  #
  def tableize(input)
    word = input.gsub(/::/, '_')
    pluralize(underscorize(word))
  end

  # Classify input
  #
  # Create a class name from a plural table name like Rails does for table names to models.
  # Note that this returns a string and not a Class.
  #
  # To convert to an actual class # follow +classify+ with +constantize+.
  #
  # @examples:
  #
  #   Flexus.classify("egg_and_hams") # => "EggAndHam"
  #   Flexus.classify("posts")        # => "Post"
  #
  #   # Singular names are not handled correctly:
  #   Flexus.classify("business")     # => "Busines"
  #
  # @return [String]
  #
  # @api public
  #
  def classify(table_name)
    # strip out any leading schema name
    camelize(singularize(table_name.sub(/.*\./, '')))
  end

  # Test if word is uncountable
  #
  # @example
  #
  #   Flexus.uncountable?('rice') #=> true
  #   Flexus.uncountable?('apple') #=> false
  #
  # @param [String] word
  #
  # @return [Boolean]
  #   true, if word is uncountable
  #
  # @api public
  #
  def uncountable?(word)
    word.empty? || inflections.uncountables.include?(word.downcase)
  end

  # Convert input to underscored, lowercase string
  #
  # Contains main logic for .underscore and .tableize
  # Does nothing with '::' divider
  #
  # @param [String] input
  #
  # @example
  #   Flexus.underscorize("DataMapper")         # => "data_mapper"
  #   Flexus.underscorize("DataMapper::Errors") # => "data_mapper::errors"
  #
  # @return [String]
  #
  # @api private
  #
  def underscorize(word)
    word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    word.tr!('-', '_')
    word.downcase!
    word
  end

  def load_defaults
    inflections(&INFLECTIONS_DEFAULTS)
    self
  end

  private :underscorize
end

require 'flexus/rules_collection'
require 'flexus/inflections'
require 'flexus/inflections_defaults'
