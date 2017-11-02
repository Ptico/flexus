require 'spec_helper'

describe Flexus, '.classify' do
  it 'classifies data_mapper as DataMapper' do
    Flexus.classify(i('data_mapper')).should == 'DataMapper'
  end

  it 'classifies data.mapper as Mapper' do
    Flexus.classify(i('data.mapper')).should == 'Mapper'
  end

  it 'classifies enlarged_testes as EnlargedTestis' do
    Flexus.classify(i('enlarged_testes')).should == 'EnlargedTestis'
  end

  it 'singularizes string first: classifies data_mappers as egg_and_hams as EggAndHam' do
    Flexus.classify(i('egg_and_hams')).should == 'EggAndHam'
  end
end
