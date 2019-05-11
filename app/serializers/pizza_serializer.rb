class PizzaSerializer < ActiveModel::Serializer
  attributes :id, :topping, :person_id, :date_consumed
end
