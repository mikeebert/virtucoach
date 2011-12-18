require 'spec_helper'

describe User do

  before do
    @user = User.create first_name:"Mike", last_name:"Test", email:"mike@test.com"
    @user2 = User.create first_name:"Rosa", last_name:"Test", email:"rosa@test.com"
    @relationship = Relationship.create owner_id: @user.id, guest_id: @user2.id
  end

  it "should have a first name" do
    @user.first_name.should_not be_nil
  end
  
  it "should have a last name" do 
    @user.last_name.should_not be_nil
  end
  
  it "should have teammates" do
    @user2.teammates.owner.should include(@user)
  end

  it "should have viewers" do
    @user.viewers.guest.should == @user2
  end
  
end
