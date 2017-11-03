require 'spec_helper'

describe Flexus, '.camelize' do
  it 'camelizes data_mapper as DataMapper' do
    Flexus.camelize(i('data_mapper')).should == 'DataMapper'
  end

  it 'camelizes merb as Merb' do
    Flexus.camelize(i('merb')).should == 'Merb'
  end

  it 'camelizes data_mapper/resource as DataMapper::Resource' do
    Flexus.camelize(i('data_mapper/resource')).should == 'DataMapper::Resource'
  end

  it 'camelizes data_mapper/associations/one_to_many as DataMapper::Associations::OneToMany' do
    Flexus.camelize(i('data_mapper/associations/one_to_many')).should == 'DataMapper::Associations::OneToMany'
  end
end
