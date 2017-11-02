require 'spec_helper'

describe Flexus, 'underscore' do
  specify 'allows to create snake_case from CamelCase' do
    expect(Flexus.underscore('CamelCase')).to eql('camel_case')
  end
end
