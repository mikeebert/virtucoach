class Workout < ActiveRecord::Base

  belongs_to :user
  
  validates :name, presence: true,
                   length: {maximum:30}
  validates :description, length: {maximum:140}
  
  # validates :date, presence: true

  has_many :comments, dependent: :destroy

  def self.current_year
    today = Date.today
    first_day_of_year = Date.new(today.year, 1, 1)
    last_day_of_year = Date.new(today.year, 12, 31)
    self.where('date <= ? and date >= ?', last_day_of_year, first_day_of_year).order("date ASC")
  end
  
  def self.current_month    
    today = Date.today
    # next_month = Date.today.next_month
    # next_month_first_day = Date.new(next_month.year, next_month.month, 1) 
    first_day_of_month = Date.today.beginning_of_month
    last_day_of_month = Date.today.end_of_month
    self.where('date <= ? and date >= ?', last_day_of_month, first_day_of_month).order("date ASC")
  end
  
  def self.selected_month(date)
    first_day_of_month = date.beginning_of_month
    last_day_of_month = date.end_of_month
    self.where('date <= ? and date >= ?', last_day_of_month, first_day_of_month).order("date ASC")    
  end
  
  
  
  private
  
  def first_day_of_month
    
  end
end
