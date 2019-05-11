module API
  module V1
    class PeopleController < ApplicationController
      # GET all people
      get '/people' do
        @people = Person.all
        render json: @people
      end

      # GET person by name
      get '/people/:name' do
        @person = Trip.find_by(name: params[:name])
        render json: @person
      end
    end
  end
end
