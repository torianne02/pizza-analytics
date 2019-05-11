module API
  module V1
    class People < Grape::API
      version 'v1', using: :path, vendor: 'pizza-analytics'

      resource :people do
        # returns ALL people
        desc "Return all people"
        get "/" do
          Person.all.as_json_api
        end

        # returns ONE person by NAME
        desc "Return a person"
        params do
          requires :name, type: String, desc: "Name of the person"
        end
        get ":name" do
          Person.where(name: permitted_params[:name]).as_json_api
        end
      end
    end
  end
end
