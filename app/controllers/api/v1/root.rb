Dir['./api/*.rb'].each {|file| require file}
require 'grape-swagger'

module API
  module V1
    class Root < Grape::API
      prefix :api
      version :v1, using: :path
      default_format :json
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      use Rack::Session::Cookie, secret: ENV['SESSION_SECRET']

      helpers do
        def default_serializer_options
          {root: false}
        end
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error_response(message: e.message, status: 404)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error_response(message: e.message, status: 422)
      end

      mount API::V1::People
      mount API::V1::Pizzas

      add_swagger_documentation(
        api_version: "v1",
        hide_documentation_path: true,
        mount_path: '/api/v1/swagger_doc',
        hide_format: true
      )
    end
  end
end
