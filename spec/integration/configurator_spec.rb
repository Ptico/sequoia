require 'spec_helper'

describe Sequoia::Configurator do
  let(:instance) { described_class.new }

  let(:config) do
    instance.configure do
      working_folder '/srv'
      timeout 30
      database do
        adapter 'postgres'
      end
    end

    instance.configure :development do
      timeout 60
      cache false
      database do
        user 'dev'
        pass 'null'
      end
    end

    instance.configure :production do
      timeout 20
      production true
      database do
        user 'admin'
        pass 'secret'
      end
    end

    instance
  end

  let(:result) { config.build(env) }

  context 'without env' do
    let(:env) { nil }

    it 'should build config' do
      expect(result.working_folder).to eql('/srv')
      expect(result.timeout).to eql(30)
    end
  end

  context 'with env' do
    let(:env) { :development }

    it 'should merge config' do
      expect(result.working_folder).to eql('/srv')
      expect(result.timeout).to eql(60)
      expect(result.cache).to be_false
    end

    it 'should merge namespaces' do
      expect(result.database.adapter).to eql('postgres')
      expect(result.database.user).to eql('dev')
    end
  end
end