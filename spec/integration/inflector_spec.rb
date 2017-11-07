require 'spec_helper'

describe Flexus, 'underscore' do
  specify 'allows to create snake_case from CamelCase' do
    expect(Flexus.underscore('CamelCase')).to eql('camel_case')
  end

  describe 'allows to use per instance inflections' do
    let(:flexus_instance) { Flexus.new }

    describe 'being able to override defaults' do
      before do
        flexus_instance.inflections do |inflect|
          inflect.plural(/\z/, 'zishes')
        end
      end

      it { expect(Flexus.pluralize("dog")).to          eq "dogs" }
      it { expect(flexus_instance.pluralize("dog")).to eq "dogzishes" }
    end

    describe 'importing defaults to each instance' do
      before { flexus_instance.load_defaults }

      it { expect(Flexus.pluralize("status")).to eq "statuses" }
      it { expect(flexus_instance.pluralize("status")).to eq "statuses" }
    end

    describe 'not importing defaults to each instance' do
      it { expect(Flexus.pluralize("status")).to eq "statuses" }
      it { expect(flexus_instance.pluralize("status")).to eq "status" }
    end
  end
end
