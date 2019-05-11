class PizzaSerializer < ActiveModel::Serializer
  attributes :id, :type, :person_id, :date_consumed
end 
