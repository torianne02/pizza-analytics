class Person < ActiveRecord::Base
  has_many :pizzas

  validates :topping, presence: true 
end
