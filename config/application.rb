# unsure at the moment if this is correct - MAY DELETE/MOVE

module Api
  class Application < Sinatra::Base
    config.middleware.use Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end
    config.active_record.raise_in_transactional_callbacks = true
  end
end
