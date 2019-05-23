require 'grape'
require 'sinatra'
require 'sequel'
require 'sequel/extensions/seed'
# require 'csv'
# require 'grape-active_model_serializers'

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
    # formatter :json, Grape::Formatter::ActiveModelSerializers
    prefix :api

    get :status do
      { status: 'ok' }
    end

      mount V1::People
      mount V1::Pizzas
  end
end

# loads seed data into db
Sequel::Seeder.apply(DB, "db/seeds/")

# loads CSV file data - - COULD NOT GET TO WORK
# CSV.foreach("db/data.csv", headers: true) do |row|
#   @person_id = DB["INSERT INTO people (name) VALUES ('#{row[0]}')
#     ON CONFLICT DO NOTHING RETURNING id"]
    # @person_id
    # puts @person_id.first
  # @pizza_id = DB["
  #   INSERT INTO pizzas (person_id, topping, date_consumed)
  #   VALUES (#{@person_id}, '#{row[1]}', '#{row[2]}')
  #   retruning id"]
  # # @pizza_id = @pizza_id.map(:id)
  #
  # @resultset = DB["select * from pizzas where id = '#{@pizza_id}'"]
  # @resultset = @resultset.all
  # @resultset.each do |result|
  #   puts result
  # end
# end

# sets environment to SINATRA_ENV base and development, if not available
ENV['SINATRA_ENV'] ||= "development"

# sets up the load paths and automatically requires all dependencies
require 'bundler'
Bundler.require(:default, ENV['SINATRA_ENV'])

# mount Grape application
PizzaAnalytics = Rack::Builder.new {
  map "/" do
    run API::Root
  end
}
