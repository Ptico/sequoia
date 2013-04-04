require 'spec_helper'

describe Sequoia::Entity do
  let(:instance) { Sequoia::Entity.create(hash) }

  let(:hash) do
    Sequoia::Store.new({
      working_folder: '/srv',
      database: Sequoia::Store.new(name: 'test_db', user: 'inferno'),
      creds: { user: 'admin', pass: 'secret' }
    })
  end

  it 'should be frozen' do
    expect(instance).to be_frozen
  end

  it 'should respond to keys' do
    expect(instance).to respond_to(:working_folder)
  end

  it 'should keep hashes' do
    expect { instance.creds.user }.to raise_error
    expect(instance.creds[:user]).to eql('admin')
  end

  context 'as object' do
    it 'should get keys' do
      expect(instance.working_folder).to eql('/srv')
    end

    it 'should get namespaces' do
      expect(instance.database.name).to eql('test_db')
    end
  end

  context 'as hash' do
    it 'should get keys as hash keys' do
      expect(instance[:working_folder]).to eql('/srv')
    end

    it 'should get namespaces' do
      expect(instance[:database][:name]).to eql('test_db')
    end
  end
end