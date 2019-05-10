class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :type
      t.datetime :date_consumed
      t.integer :person_id
    end
  end
end
