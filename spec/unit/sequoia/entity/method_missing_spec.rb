require 'spec_helper'

describe Sequoia::Entity, '#method_missing' do
  let(:instance) { Sequoia::Entity.create(hash) }
  let(:hash)     { Sequoia::Store.new(working_folder: '/srv') }

  it 'should not raise exception' do
    expect { instance.nonexist }.to_not raise_error
  end
end
