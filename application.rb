require 'grape'
require 'sinatra'
require 'sequel'
require 'sequel/extensions/seed'

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

Sequel::Seeder.apply(DB, "db/seeds/")

ENV['SINATRA_ENV'] ||= "development"

require 'bundler'
Bundler.require(:default, ENV['SINATRA_ENV'])

# mount Grape application
PizzaAnalytics = Rack::Builder.new {
  map "/" do
    run API::Root
  end
}
