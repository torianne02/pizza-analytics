Sequel.migration do
  change do
    create_table(:pizzas) do
      primary_key :id
      String :topping, :null => false
      Date :date_consumed, :null => false
      foreign_key :person_id, :people
    end
  end
end 
