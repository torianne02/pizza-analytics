module API
  module V1
    class People < Grape::API
      include API::V1::Defaults

      resource :people do
        desc "Return all people"
        get "", root: :people do
          People.all
        end

        desc "Return a person"
        params do
          requires :name, type: String, desc: "Name of the person"
        end
        get ":name", root: "person" do
          Person.where(name: permitted_params[:name]).first!
        end
      end
    end
  end
end
