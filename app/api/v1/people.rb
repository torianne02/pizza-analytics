module API
  module V1
    class People < Grape::API
      version 'v1', using: :path

      resource :people do
        # returns ALL people
        desc "Return all people"
        get "/" do
          Person.all
        end

        # returns ONE person by NAME
        desc "Return a person"
        params do
          requires :name, type: String, desc: "Name of the person"
        end
        get ":name" do
          Person.where(name: permitted_params[:name])
        end
      end
    end
  end
end
