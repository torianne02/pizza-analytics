require 'grape'
require 'sinatra'
require 'sequel'
require 'sequel/extensions/seed'
require 'csv'

# load the seed extension
Sequel.extension :seed

# establish Sequel connection to db
DB = Sequel.connect(adapter: :postgres, database: 'pizza_analytics_development', host: 'localhost')

# loading files from the models and api folders
Dir["#{File.dirname(__FILE__)}/app/models/**/*.rb"].each { |f| require f }
Dir["#{File.dirname(__FILE__)}/app/api/**/*.rb"].each { |f| require f }

# Grape API class
module API
  class Root < Grape::API
    format :json
    prefix :api

    get :status do
      { status: 'ok' }
    end

      mount V1::People
      mount V1::Pizzas
  end
end

loads seed data into db
Sequel::Seeder.apply(DB, "db/seeds/")

# loads CSV file data - - COULD NOT GET TO WORK
# CSV.foreach("db/data.csv", headers: true) do |row|
#   @person_id = DB["SELECT id FROM people WHERE name=#{row[0]}"]
#   if @person_id == nil
#     @person_id = DB["INSERT INTO people (name) VALUES (#{row[0]}) returning id"]
#   end
#
#   DB["INSERT INTO pizzas (person_id, topping, date_consumed) VALUES (#{@person_id}, #{row[1]}, #{row[2]})"]
# end

ENV['SINATRA_ENV'] ||= "development"

require 'bundler'
Bundler.require(:default, ENV['SINATRA_ENV'])

# mount Grape application
PizzaAnalytics = Rack::Builder.new {
  map "/" do
    run API::Root
  end
}
