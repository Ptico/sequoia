require 'spec_helper'

describe Sequoia::Store, '#deep_merge!' do
  let(:subject)  { instance.deep_merge!(secondary_hash) }
  let(:instance) { described_class.new(start_hash) }
  let(:start_hash) do
    {
      working_folder: '/srv',
      database: { name: 'test_db' },
      creds: Sequoia::Store.new(name: 'admin')
    }
  end

  context 'empty store' do
    let(:instance) { described_class.new }
    let(:secondary_hash) { Sequoia::Store.new(working_folder: '/srv') }

    it 'should merge' do
      expect(subject[:working_folder]).to eql('/srv')
    end
  end

  context 'nested stores' do
    let(:secondary_hash) { Sequoia::Store.new(creds: Sequoia::Store.new(pass: 'secret')) }

    it 'should merge' do
      expect(subject[:creds][:name]).to eql('admin')
      expect(subject[:creds][:pass]).to eql('secret')
    end
  end

  context 'nested hashes' do
    let(:secondary_hash) { { database: { user: 'postgres' } } }

    it 'should rewrite' do
      expect(subject[:database][:user]).to eql('postgres')
      expect(subject[:database][:name]).to be_nil
    end
  end
end