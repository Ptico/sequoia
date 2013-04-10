require 'spec_helper'

describe Sequoia::Configurable, '#configure' do
  let(:object) {
    Class.new do
      include Sequoia::Configurable
      attr_reader :foo
    private
      def initialize(foo)
        @foo = foo
      end
    end
  }
  let(:instance) { object.new(5) }
  let(:attrs)    { instance.instance_variable_get(:@config_attributes) }

  it 'should not be broken when included' do
    expect { instance.configure }.to_not raise_error
  end

  it 'should create default environment' do
    instance.configure do
      path '/home'
    end

    expect(attrs[:default]).to have_key(:path)
  end

  it 'environment should be a store' do
    instance.configure do
      path '/home'
    end

    expect(attrs[:default]).to be_instance_of(Sequoia::Store)
  end

  it 'should create custom environment' do
    instance.configure :development do
      path '/home'
    end

    expect(attrs[:development]).to have_key(:path)
  end
end