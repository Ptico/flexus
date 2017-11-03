require 'spec_helper'

describe Flexus, '.underscore' do
  it 'underscores DataMapper as data_mapper' do
    Flexus.underscore(i('DataMapper')).should == 'data_mapper'
  end

  it 'underscores Merb as merb' do
    Flexus.underscore(i('Merb')).should == 'merb'
  end

  it 'underscores DataMapper::Resource as data_mapper/resource' do
    Flexus.underscore(i('DataMapper::Resource')).should == 'data_mapper/resource'
  end

  it 'underscores Merb::BootLoader::Rackup as merb/boot_loader/rackup' do
    Flexus.underscore(i('Merb::BootLoader::Rackup')).should == 'merb/boot_loader/rackup'
  end

  it 'underscores data-mapper as data_mapper' do
    Flexus.underscore(i('data-mapper')).should == 'data_mapper'
  end

  it 'underscores CLI as cli' do
    Flexus.underscore(i('CLI')).should == 'cli'
  end

  it 'underscores castleKing as castle_king' do
    Flexus.underscore(i('castleKing')).should == 'castle_king'
  end

  it 'underscores CLIRunner as cli_runner' do
    Flexus.underscore(i('CLIRunner')).should == 'cli_runner'
  end
end
