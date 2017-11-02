require 'spec_helper'

describe Flexus, '.demodulize' do
  it 'demodulizes module name: DataMapper::Inflecto => Inflecto' do
    Flexus.demodulize(i('DataMapper::Inflecto')).should == 'Inflecto'
  end

  it 'demodulizes module name: A::B::C::D::E => E' do
    Flexus.demodulize(i('A::B::C::D::E')).should == 'E'
  end
end
