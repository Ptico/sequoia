require 'spec_helper'

describe Sequoia::Builder, '#respond_to?' do
  let(:instance) { described_class.new }

  it 'should respond to any method' do
    expect(instance).to respond_to(:qqeeellzmls)
  end
end