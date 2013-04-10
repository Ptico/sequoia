require 'spec_helper'

describe Sequoia::Entity, '#pretty_inspect' do
  let(:subject)  { instance.pretty_inspect }
  let(:instance) { Sequoia::Entity.create(hash) }
  let(:hash)     { Sequoia::Store.new(working_folder: '/srv') }

  it 'should return string' do
    expect(subject).to be_instance_of(String)
  end

  it 'should represent hash' do
    expect(subject).to match(/^\{\:?working_folder.*srv/)
  end
end