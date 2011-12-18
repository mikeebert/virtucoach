class User < ActiveRecord::Base

  has_secure_password
  
  has_many :workouts, dependent: :destroy

  has_many :comments, dependent: :destroy
  
  
  has_many :teammates, class_name: "Relationship", foreign_key: "guest_id"  
  has_many :viewers, class_name: "Relationship", foreign_key: "owner_id"
  
  
  
  validates_presence_of :first_name
            
  validates :last_name, presence: true,
                        length: {minimum: 2, maximum: 24}
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }


end
