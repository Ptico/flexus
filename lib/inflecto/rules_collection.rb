module Inflecto
  # Wraps inflections array
  #
  class RulesCollection
    extend Forwardable

    def_delegators :@collection,
      :each, :insert, :empty?,
      :size, :last, :include?

    def initialize(*args)
      @collection = Array.new(*args)
    end

    # Applies first found rule to given word
    #
    # @param [String] word
    #
    # @return [String]
    #   modified word
    #
    # @api private
    #
    def apply_to(word)
      result = word.dup
      each { |rule, replacement| break if result.gsub!(rule, replacement) }
      result
    end

    def ==(other)
      @collection == other.to_a
    end

    def to_a
      @collection.dup
    end
  end
end
