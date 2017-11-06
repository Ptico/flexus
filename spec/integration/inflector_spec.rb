require 'spec_helper'

describe Flexus, 'underscore' do
  specify 'allows to create snake_case from CamelCase' do
    expect(Flexus.underscore('CamelCase')).to eql('camel_case')
  end

  describe 'allows to use per instance inflections' do
    let(:flexus_instance) { Flexus.new }

    before do
      flexus_instance.inflections do |inflect|
        inflect.plural(/\z/, 'zishes')
      end
    end

    it { expect(Flexus.pluralize("dog")).to          eq "dogs" }
    it { expect(flexus_instance.pluralize("dog")).to eq "dogzishes" }
  end
end
