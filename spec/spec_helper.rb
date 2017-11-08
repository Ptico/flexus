# encoding: utf-8

require 'devtools/spec_helper'

if ENV['COVERAGE'] == 'true'
  require 'simplecov'

  SimpleCov.start do
    command_name     'spec:unit'
    add_filter       'config'
    add_filter       'spec'
    minimum_coverage 100
  end
end

require 'dry/inflector'

class Flexus
  extend SingleForwardable

  def_single_delegators :instance,
    :camelize, :underscore, :dasherize,
    :demodulize, :foreign_key, :constantize,
    :ordinalize, :inflections, :pluralize,
    :singularize, :humanize, :tableize,
    :classify, :uncountable?, :underscorize

  def self.instance
    @__instance__ ||= Dry::Inflector.new
  end
end

def self.Flexus()
  Flexus.instance
end

Flexus::Inflections = Dry::Inflector::Inflections
Flexus::RulesCollection = Dry::Inflector::Rules

# require spec support files and shared behavior
Dir[File.expand_path('../{support,shared}/**/*.rb', __FILE__)].each do |file|
  require file
end

RSpec.configure do |config|
  # Helps to ensure that flexus does not modify original input
  def i(object)
    object.freeze
  end
end
