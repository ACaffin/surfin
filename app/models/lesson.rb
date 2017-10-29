class Lesson < ActiveRecord::Base
  belongs_to :user
  
  validates :lesson_level, presence: true
  validates :lesson_duration, presence: true
  validates :price, numericality: {only_integer: true, greater_than: 10}
end
