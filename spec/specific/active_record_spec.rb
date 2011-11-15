require 'spec_helper'

describe UniqueGenerator, 'along side active record' do

  # Temporary environment
  let(:manager) { ReversibleData.manager_for(:users) }
  before(:each) { manager.up! }
  after(:each)  { manager.down! }

  let(:example_model) { User }

  it_should_behave_like 'a model with unique generator enabled'

end