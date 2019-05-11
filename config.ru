require_relative './config/environment'
require 'grape'
require './app'
require './controllers/api/base.rb'
require 'rack/cors'

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

run Rack::Cascade.new [API::Base]
