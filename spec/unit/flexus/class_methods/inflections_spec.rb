require 'spec_helper'

describe Flexus, '.inflections' do
  context 'when block given' do
    it 'yields inflections instance' do
      yielded = nil

      described_class.inflections do |inflect|
        yielded = inflect
      end

      yielded.should be(Flexus.instance.inflections_instance)
    end
  end

  context 'when without block' do
    subject { described_class.inflections }

    it { should be(Flexus.instance.inflections_instance) }
  end
end
