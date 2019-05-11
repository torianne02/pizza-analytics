class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :topping
      t.date :date_consumed
      t.integer :person_id
    end
  end
end
