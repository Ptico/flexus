require 'spec_helper'

describe Flexus, '.tableize' do
  it 'pluralizes last word in snake_case strings: fancy_category => fancy_categories' do
    Flexus.tableize(i('fancy_category')).should == 'fancy_categories'
  end

  it 'underscores CamelCase strings before pluralization: enlarged_testis => enlarged_testes' do
    Flexus.tableize(i('enlarged_testis')).should == 'enlarged_testes'
  end

  it 'underscores CamelCase strings before pluralization: FancyCategory => fancy_categories' do
    Flexus.tableize(i('FancyCategory')).should == 'fancy_categories'
  end

  it 'underscores CamelCase strings before pluralization: EnlargedTestis => enlarged_testes' do
    Flexus.tableize(i('EnlargedTestis')).should == 'enlarged_testes'
  end

  it 'replaces :: with underscores: My::Fancy::Category => my_fancy_categories' do
    Flexus.tableize(i('My::Fancy::Category')).should == 'my_fancy_categories'
  end

  it 'underscores CamelCase strings before pluralization: Enlarged::Testis => enlarged_testes' do
    Flexus.tableize(i('Enlarged::Testis')).should == 'enlarged_testes'
  end
end
