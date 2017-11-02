require 'spec_helper'

describe Inflecto::RulesCollection, '#to_a' do
  let(:rules_collection) { described_class.new }
  let(:array) { rules_collection.to_a }
  let(:collection_instance) do
    rules_collection.instance_variable_get(:@collection)
  end

  it { expect(array).to be_an_instance_of(Array) }
  it { expect(rules_collection).to be_an_instance_of(Inflecto::RulesCollection) }
  it { expect(array).to eq collection_instance }
end
