class Reading < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true  
  validates :reading_date, presence: true
  validates :duration_in_min, presence: true
  validates :duration_in_min, numericality: { only_integer: true }  
  validates :user_id, presence: true  
end
