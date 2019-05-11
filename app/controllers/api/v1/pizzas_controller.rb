module API
  module V1
    class PizzasController < ApplicationController
      # GET all pizzas
      get '/pizzas' do
        @pizzas = Pizza.all
        render json: @pizzas
      end

      # GET pizza by topping
      get '/pizzas/:topping' do
        @pizza = Pizza.find_by(topping: params[:topping])
        render json: @pizza
      end

      # GET consecutive day streak where each day is > the day before
      get 'pizzas/consecutive_days' do
        @pizzas = Pizza.all
        # need to figure out logic for adding pizzas up each day and comparing
      end

      # GET day within month that has highest consumption
      get '/pizzas/highest_consumption' do
        @pizzas = Pizza.all
        # need to figure out logic for adding pizzas for each day
        # will store day sums in obj and will find max - return day
      end
    end
  end
end
