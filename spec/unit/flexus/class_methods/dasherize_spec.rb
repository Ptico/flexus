require 'spec_helper'

describe Flexus, '.dasherize' do
  it 'dasherizes data_mapper_rspec as data-mapper-rspec' do
    Flexus.dasherize(i('data_mapper_rspec')).should == 'data-mapper-rspec'
  end
end
