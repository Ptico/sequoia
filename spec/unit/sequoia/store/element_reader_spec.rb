require 'spec_helper'

describe Sequoia::Store, '#[]' do
  let(:instance) { described_class.new(hash) }
  let(:hash) {
    {
      working_folder: '/srv',
      database: { name: 'test_db' }
    }
  }

  it 'should read keys' do
    expect(instance[:working_folder]).to eql('/srv')
  end

  it 'should should store nested hashes' do
    expect(instance[:database]).to be_a(Hash)
  end
end