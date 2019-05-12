class Pizza < Sequel::Model
  many_to_one :person

  # validates :topping, presence: true
end
