require 'spec_helper'

describe API::V1::Pizzas do
  include Rack::Test::Methods

  def app
    OUTER_APP
  end

  let(:pepperoni) { Pizza.new(topping: "pepperoni", person_id: 1, date_consumed: "2019-05-10") }
  let(:sausage) { Pizza.new(topping: "sausage", person_id: 1, date_consumed: "2019-05-11") }
  let(:pineapple) { Pizza.new(topping: "pineapple", person_id: 3, date_consumed: "2019-05-11") }

  describe 'GET /api/v1/pizzas/monthly-sales' do
    before do
      get "/api/v1/pizzas/monthly-sales"
    end

    it 'returns HTTP status 200' do
      expect(last_response.status).to eq 200
    end

    it "returns the day of each month with the highest number of pizzas consumed" do
      # expect(JSON.parse(last_response.body)).to include({"date_consumed"=>"2015-01-07", "num_sales"=>3})
    end
  end

  describe 'GET /api/v1/pizzas/streaks' do
    before do
      get "/api/v1/pizzas/streaks"
    end

    it 'returns HTTP status 200' do
      expect(last_response.status).to eq 200
    end

    it "returns streaks where the current day is greater than the previous day" do
      # expect(JSON.parse(last_response.body)).to include({"date_consumed"=>"2015-01-07", "num_pizzas"=>2})
    end
  end
end
