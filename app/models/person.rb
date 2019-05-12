class Person < Sequel::Model
  one_to_many :pizzas

  def validate
    super
    errors.add(:name, "must be present") if name.empty?
  end 
end
