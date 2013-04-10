require 'spec_helper'

describe Sequoia::Entity, '#to_s' do
  let(:subject)  { instance.to_s }
  let(:instance) { Sequoia::Entity.create(hash) }
  let(:hash)     { Sequoia::Store.new(working_folder: '/srv') }

  it 'should return string' do
    expect(subject).to be_instance_of(String)
  end

  it 'should represent hash' do
    expect(subject).to match(/^\{\:?working_folder.*srv/)
  end
end