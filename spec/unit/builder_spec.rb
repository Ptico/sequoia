require 'spec_helper'

describe Configga::Builder do

  let(:result) { instance.attrs }

  shared_examples 'block_attributes' do
    it 'should set values' do
      expect(result[:working_folder]).to eql('/srv')
      expect(result[:timeout]).to        eql(30)
    end

    it 'should set namespaces' do
      expect(result[:database][:name]).to eql('test_db')
    end

    it 'should manage deep namespaces' do
      expect(result[:database][:creds][:user]).to eql('admin')
      expect(result[:database][:creds][:pass]).to eql('secret')
    end

    it 'should store hashes as hashes' do
      expect(result[:database].class).to eql(Configga::Store)
      expect(result[:creds].class).to    eql(Hash)
    end
  end

  describe 'Block-style' do
    let(:instance) do
      described_class.new do
        working_folder '/srv'
        timeout 30
        creds(user: 'admin', pass: 'secret')

        database do
          creds do
            user 'admin'
            pass 'secret'
          end
          name 'test_db'
        end
      end
    end

    it_behaves_like 'block_attributes'
  end

  describe 'Object-style' do
    let(:instance) do
      inst = described_class.new

      inst.working_folder = '/srv'
      inst.timeout = 30
      inst.creds = { user: 'admin', pass: 'secret' }

      inst.database.creds.user = 'admin'
      inst.database.creds.pass = 'secret'
      inst.database.name = 'test_db'

      inst
    end

    it_behaves_like 'block_attributes'
  end
end