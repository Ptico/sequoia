require 'spec_helper'

describe Configga::Store do
  let(:instance) { described_class.new(hash) }
  let(:hash) do
    {
      working_folder: '/srv',
      database: { name: 'test_db' },
      creds: Configga::Store.new(name: 'admin')
    }
  end

  it 'should create instance from hash' do
    expect(instance[:working_folder]).to eql('/srv')
  end

  it 'should set nested hashes' do
    expect(instance[:database]).to be_a(Hash)
  end

  it 'should merge nested stores' do
    instance.deep_merge(Configga::Store.new(creds: Configga::Store.new(pass: 'secret')))
    expect(instance[:creds][:name]).to eql('admin')
    expect(instance[:creds][:pass]).to eql('secret')
  end
end