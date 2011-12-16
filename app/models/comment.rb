class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :workout
  
  validates_presence_of :user, :workout, :note
  
end
