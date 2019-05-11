require 'grape'

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
  end
end

# mount Grape application

PizzaAnalytics = Rack::Builder.new {
  map "/" do
    run API::Root
  end
}
