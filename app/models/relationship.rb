class Relationship < ActiveRecord::Base
  
  validates_presence_of :owner_id, :guest_id
  
  belongs_to :owner, class_name:"User", foreign_key:"owner_id"
  belongs_to :guest, class_name:"User", foreign_key:"guest_id"

  def display_name
    "#{owner.first_name} #{owner.last_name}"
  end

  def coach
    self.edit == true
  end
      
end
