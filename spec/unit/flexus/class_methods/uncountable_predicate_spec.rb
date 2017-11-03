require 'spec_helper'

describe Flexus, '.uncountable?' do
  it 'truthy when empty string' do
    Flexus.uncountable?('').should be(true)
  end

  it 'truthy when word is present in list' do
    Flexus.uncountable?('grass').should be(true)
  end

  it 'falsy when word is not present in list' do
    Flexus.uncountable?('user').should be(false)
  end

  it 'truthy when word is present in list but in different case' do
    Flexus.uncountable?('FiSH').should be(true)
  end
end
