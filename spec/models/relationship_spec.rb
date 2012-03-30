require 'spec_helper'

describe Relationship do

  before do 
    @user = User.create first_name:"Mike", last_name:"Test", email:"test@test.com"
    @user2 = User.create first_name:"Rosa", last_name:"Test", email:"test2@test.com"
    @user3 = User.create first_name:"Gipper", last_name:"Test", email:"test3@test.com"
    @relationship = Relationship.create owner_id: @user.id, guest_id: @user2.id
    @relationship2 = Relationship.create owner_id: @user.id, guest_id: @user3.id, edit:true
  end
  
  it "should have an owner" do 
    @relationship.owner.should == @user.id
  end
  
  it "should have a a guest" do 
    @relationship.guest.should == @user2.id
  end
  
  it "User should be a coach if they are the guest and edit is true" do
    @relationship2.coach.should == true
    @relationship.coach.should == false
  end
    
  
end
