class Pizza < Sequel::Model
  many_to_one :person

  def validate
    super
    errors.add(:topping, "must be present") if topping.empty?
    errors.add(:date_consumed, "must be present") if date_consumed.empty?
  end
end
