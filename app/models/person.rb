class Person < ActiveRecord::Base
  has_many :pizzas

  validates :name, presence: true 
end
