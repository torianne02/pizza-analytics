require_relative './config/environment'
require 'grape'
require './app'
require './controllers/api'
require 'rack/cors'

# class API < Grape::API
#   mount API::Base, at: '/'
# end

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::Cors do
  allow do
    origins '*'
    resource '*',
      headers: :any,
      methods: [:get]
  end
end

# use Rack::MethodOverride
run Rack::Cascade.new [API::Root]
# run ApplicationController
