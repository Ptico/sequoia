require 'spec_helper'

describe Sequoia::Entity, '#to_hash' do
  let(:subject)  { instance.to_hash }
  let(:instance) { Sequoia::Entity.create(hash) }
  let(:hash)     { Sequoia::Store.new(working_folder: '/srv') }

  it 'should convert instance to hash' do
    expect(subject).to be_instance_of(Hash)
    expect(subject).to eq({working_folder: '/srv'})
  end
end