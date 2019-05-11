class Pizza < ActiveRecord::Base
  belongs_to :person

  validates :name, presence: true 
end
