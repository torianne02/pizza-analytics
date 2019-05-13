module API
  module V1
    class People < Grape::API
      version 'v1', using: :path

      resource :people do
        desc 'Return all people'
        get '/' do
          # returns person by name if name param is provided
          if params.include?("name")
            Person.where(name: params[:name]).first!
          # returns all people if there is no name param
          else
            Person.all
          end
        end
      end
    end
  end
end
