require 'spec_helper'

describe Sequoia::Builder, '#class' do
  let(:subject)  { instance.class }
  let(:instance) { described_class.new }

  it 'should return class of instance' do
    expect(subject).to eql(described_class)
  end
end