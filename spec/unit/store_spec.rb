require 'spec_helper'

describe Sequoia::Store do
  let(:instance) { described_class.new(hash) }
  let(:hash) do
    {
      working_folder: '/srv',
      database: { name: 'test_db' },
      creds: Sequoia::Store.new(name: 'admin')
    }
  end

  it 'should create instance from hash' do
    expect(instance[:working_folder]).to eql('/srv')
  end

  it 'should set nested hashes' do
    expect(instance[:database]).to be_a(Hash)
  end

  it 'should merge nested stores' do
    instance.deep_merge(Sequoia::Store.new(creds: Sequoia::Store.new(pass: 'secret')))
    expect(instance[:creds][:name]).to eql('admin')
    expect(instance[:creds][:pass]).to eql('secret')
  end
end