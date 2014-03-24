require 'spec_helper'

describe Sequoia::Configurable, '#build' do
  let(:instance) { Class.new.send(:include, Sequoia::Configurable).new }

  it 'should return object if empty' do
    expect(instance.build_configuration).to be_an(Object)
  end

  it 'should return entity if not empty' do
    instance.configure do
      path '/home'
    end

    expect(instance.build_configuration).to be_a(Sequoia::Entity)
  end

  it 'should merge envs' do
    instance.configure do
      path '/home'
    end

    instance.configure :test do
      log_level :info
    end

    expect(instance.build_configuration('test').path).to     eq('/home')
    expect(instance.build_configuration(:test).log_level).to eq(:info)
  end
end
