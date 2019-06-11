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
