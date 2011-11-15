require 'spec_helper'

describe UniqueGenerator, 'along side mongo mapper' do

  class ExampleModel
    include MongoMapper::Document
    include UniqueGenerator
    
    key :name,  String
    key :token, String
    
  end

  let(:example_model) { ExampleModel }
  after(:each)        { ExampleModel.destroy_all }

  it_should_behave_like 'a model with unique generator enabled'

end