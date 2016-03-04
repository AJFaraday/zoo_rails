require 'spec_helper'

describe Animal do

  let(:animal) {Animal.find(1)}

  before(:each) do
 
  end

  it 'should know if it was born in the future' do
    animal.date_of_birth = Date.today + 1.day
    animal.born_in_the_future?.should be_true
  end 

  it 'should validate that it was not born in the future' do
    animal.date_of_birth = Date.today + 1.day
    animal.valid?.should be_false
    animal.errors[:date_of_birth].should_not be_empty
  end

  it 'it should be fed' do
    time = Time.now
    Time.now.stub(:now => time)
    animal.feed
    animal.last_fed.to_i.should eq(time.to_i)
  end

end

