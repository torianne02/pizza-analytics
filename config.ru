require './application'
require 'rack/cors'
require 'thin'

# allow CORS
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end 
end

run PizzaAnalytics
