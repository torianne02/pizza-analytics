class Person < Sequel::Model
  one_to_many :pizzas

  # validates :name, presence: true 
end
