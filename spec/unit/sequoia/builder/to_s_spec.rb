require 'spec_helper'

describe Sequoia::Builder, '#to_s' do
  let(:subject)  { instance.to_s }
  let(:instance) { described_class.new }

  it 'should return string' do
    expect(subject.class).to eql(String)
  end

  it 'should contain class name' do
    expect(subject).to start_with('#<Sequoia::Builder>')
  end

  it 'should contain attrs hash' do
    expect(subject).to match(/attrs={.*}/)
  end
end
