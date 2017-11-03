require 'spec_helper'

describe Flexus, '.foreign_key' do
  it 'adds _id to downcased string: Message => message_id' do
    Flexus.foreign_key(i('Message')).should == 'message_id'
  end

  it 'demodulizes string first: Admin::Post => post_id' do
    Flexus.foreign_key(i('Admin::Post')).should == 'post_id'
  end
end
