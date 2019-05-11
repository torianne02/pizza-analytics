# require './pizzas_controller.rb'
# require './people_controller.rb'

# module API
#   module V1
    class ApplicationController < Sinatra::Base
      set :namespace, '/api/v1'

      configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
      end

      get '/' do
        "Hello Kevin"
      end

      # use PeopleController
      # use PizzasController
    end
#   end
# end
