class Pizza < ActiveRecord::Base
  belongs_to :person

  validates :topping, presence: true 
end
