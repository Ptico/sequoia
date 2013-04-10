require 'spec_helper'

describe Sequoia::Entity, '.create' do
  let(:subject) { Sequoia::Entity.create(hash) }
  let(:empty_subject) { Sequoia::Entity.create }

  let(:hash) do
    Sequoia::Store.new({
      working_folder: '/srv',
      database: Sequoia::Store.new(name: 'test_db', user: 'inferno'),
      creds: { user: 'admin', pass: 'secret' }
    })
  end

  it 'should create empty object if empty' do
    expect(empty_subject).to be_instance_of(Object)
    expect(empty_subject).to be_frozen
  end

  it 'should be frozen' do
    expect(subject).to be_frozen
  end

  it 'should keep hashes' do
    expect { subject.creds.user }.to raise_error
    expect(subject.creds[:user]).to eql('admin')
  end

  context 'as object' do
    it 'should get keys' do
      expect(subject.working_folder).to eql('/srv')
    end

    it 'should get namespaces' do
      expect(subject.database.name).to eql('test_db')
    end
  end

  context 'as hash' do
    it 'should get keys' do
      expect(subject[:working_folder]).to eql('/srv')
    end

    it 'should get namespaces' do
      expect(subject[:database][:name]).to eql('test_db')
    end
  end
end