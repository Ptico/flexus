require 'spec_helper'

describe Flexus, '.constantize' do
  it 'constantizes Module' do
    Flexus.constantize(i('Module')).should == Module
  end

  it 'constantizes ::Module' do
    Flexus.constantize(i('::Module')).should == Module
  end

  it 'constantizes nested constant Flexus::Inflections' do
    Flexus.constantize(i('Flexus::Inflections')).should == Flexus::Inflections
  end

  it 'does not search ancestors' do
    module Foo
      class Bar
        VAL = 10
      end

      class Baz < Bar; end
    end

    expect {
      Flexus.constantize(i('Foo::Baz::VAL'))
    }.to raise_error(NameError)
  end

  it 'searches in const_missing' do
    module Foo
      class Bar
        def self.const_missing(name)
          name.to_s == 'Const' ? Baz : super
        end
      end

      class Baz < Bar; end

      def self.const_missing(name)
        name.to_s == 'Autoloaded' ? Bar : super
      end
    end

    Flexus.constantize(i('Foo::Autoloaded::Const')).should == Foo::Baz
    Flexus.constantize(i('Foo::Bar::Const')).should == Foo::Baz
  end

  it 'raises exception when empty string given' do
    expect {
      Flexus.constantize(i(''))
    }.to raise_error(NameError)
  end

  it 'raises exception when constant not found' do
    expect {
      Flexus.constantize(i('Qwerty'))
    }.to raise_error(NameError)
  end
end
