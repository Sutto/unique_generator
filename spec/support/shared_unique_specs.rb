shared_examples_for 'a model with unique generator enabled' do

  it 'should include the mixin' do
    example_model.should be < UniqueGenerator
  end

  describe 'on an instance of an object' do
    
    before :each do
      example_model.create! :name => "Test Name A"
      example_model.create! :name => "Test Name B"
      @other_model = example_model.create! :name => "Test Name C"
    end
    
    it "should let you correctly check if a field has a unique value" do
      example_model.create(:name => "Test Name A").should_not be_unique_field :name
      example_model.create(:name => "Test Name D").should be_unique_field :name
      @other_model.should be_unique_field :name
      @other_model.name = 'Test Name A'
      @other_model.should_not be_unique_field :name
      
    end
    
    it 'should let you generate a unique token' do
      model = example_model.new
      model.token.should be_blank
      model.generate_unique_field! :token
      model.token.should be_present
    end
    
    it 'should let you generate the token length' do
      model = example_model.new
      model.generate_unique_field! :token, 100
      model.token.length.should == 100
    end
    
  end
  
  describe 'on a class including the mixin' do
    
    it 'should add a generate random method' do
      example_model.should respond_to(:generate_random)
      example_model.generate_random.should be_present
      example_model.generate_random.should_not == example_model.generate_random
    end
    
    it 'should let you specify the random string length' do
      example_model.generate_random(32).length.should == 32
      example_model.generate_random(64).length.should == 64
      example_model.generate_random(16).length.should == 16
    end
    
    it 'should let you generate a unique value' do
      example_model.should respond_to(:generate_unique)
      v = nil
      example_model.generate_unique do |value|
        v = value
      end
      v.should be_present
    end
    
    it 'should use generate random until the predicate is true' do
      times_called = 0
      mock(example_model).generate_random(32).times(3)
      example_model.generate_unique do |t|
        (times_called += 1) == 3
      end
      times_called.should == 3
    end
    
    it 'should let you pass an argument to generate random' do
      mock(example_model).generate_random(64) { 'Test' }
      example_model.generate_unique(64) { |t| true }
    end
    
  end

end