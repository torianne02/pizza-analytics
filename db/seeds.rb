# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create people
Person.create(name: 'Tori')
Person.create(name: 'Kevin')
Person.create(name: 'Eli')

# create pizzas
Pizza.create(person_id: 1, topping: 'pepperoni', date_consumed: "2019-05-05")
Pizza.create(person_id: 2, topping: 'sausage', date_consumed: "2019-05-10")
Pizza.create(person_id: 1, topping: 'bacon', date_consumed: "2019-05-04")
Pizza.create(person_id: 1, topping: 'vegetable', date_consumed: "2019-05-10")
Pizza.create(person_id: 3, topping: 'sausage', date_consumed: "2019-05-10")
Pizza.create(person_id: 2, topping: 'vegetable', date_consumed: "2019-05-05")
