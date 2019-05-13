require 'spec_helper'

describe API::V1::Pizzas do
  include Rack::Test::Methods

  def app
    OUTER_APP
  end

  describe 'GET /api/v1/pizzas/monthly-sales' do
    before do
      get "/api/v1/pizzas/monthly-sales"
    end

    it 'returns HTTP status 200' do
      expect(last_response.status).to eq 200
    end

    it "returns the day of each month with the highest number of pizzas consumed" do
      expect(JSON.parse(last_response.body)).to include(a_kind_of(Object))
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
      expect(JSON.parse(last_response.body)).to include(a_kind_of(Object))
    end
  end
end
