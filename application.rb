require 'grape'
require 'active_record'
require 'sinatra'

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

ENV['SINATRA_ENV'] ||= "development"

require 'bundler'
Bundler.require(:default, ENV['SINATRA_ENV'])

# establish ActiveRecord connection to db
configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/pizza-analytics')

 ActiveRecord::Base.establish_connection(

   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :database => db.path[1..-1]+'_test',
   :encoding => unicode
 )
end

# mount Grape application
PizzaAnalytics = Rack::Builder.new {
  map "/" do
    run API::Root
  end
}
