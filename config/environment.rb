require 'bundler'

bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'pizza-analytics_development'
)

require_all 'app'
