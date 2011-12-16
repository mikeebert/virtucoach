class Workout < ActiveRecord::Base

  belongs_to :user
  
  validates :name, presence: true,
                   length: {maximum:30}
  validates :description, length: {maximum:140}

  has_many :comments, dependent: :destroy
  
end
