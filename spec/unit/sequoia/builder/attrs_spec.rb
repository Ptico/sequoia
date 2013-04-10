require 'spec_helper'

describe Sequoia::Builder, '#attrs' do
  let(:subject)  { instance.attrs }

  shared_examples 'builder_attributes' do
    it 'should have values' do
      expect(subject[:working_folder]).to eql('/srv')
      expect(subject[:timeout]).to        eql(30)
    end

    it 'should have namespaces' do
      expect(subject[:database][:name]).to eql('test_db')
    end

    it 'should have deep namespaces' do
      expect(subject[:database][:creds][:user]).to eql('admin')
      expect(subject[:database][:creds][:pass]).to eql('secret')
    end

    it 'should handle booleans' do
      expect(subject[:async]).to be_false
    end

    it 'should store hashes as hashes' do
      expect(subject[:database]).to be_instance_of(Sequoia::Store)
      expect(subject[:creds]).to    be_instance_of(Hash)
    end
  end

  context 'Block-style' do
    let(:instance) do
      described_class.new do
        working_folder '/srv'
        timeout 30
        async false
        creds(user: 'admin', pass: 'secret')

        database do
          creds do
            user 'admin'
          end
          name 'test_db'
        end

        database do
          creds do
            pass 'secret'
          end
        end
      end
    end

    it_behaves_like 'builder_attributes'
  end

  context 'Object-style' do
    let(:instance) do
      inst = described_class.new

      inst.working_folder = '/srv'
      inst.timeout = 30
      inst.async = false
      inst.creds = { user: 'admin', pass: 'secret' }

      inst.database.creds.user = 'admin'
      inst.database.creds.pass = 'secret'
      inst.database.name = 'test_db'

      inst
    end

    it_behaves_like 'builder_attributes'
  end

  context 'Empty' do
    let(:instance) { described_class.new }

    it "should be an empty store" do
      expect(subject).to eq({})
    end
  end

end