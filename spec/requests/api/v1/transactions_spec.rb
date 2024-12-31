require 'rails_helper'

RSpec.describe "Transactions API", type: :request do
  describe "POST /api/v1/transactions/single" do
    it "creates a single transaction" do
      post '/api/v1/transactions/single'
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['status']).to eq('success')
    end
  end

  describe "POST /api/v1/transactions/bulk" do
    it "creates multiple transactions" do
      post '/api/v1/transactions/bulk'
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['status']).to eq('success')
      expect(JSON.parse(response.body)['processed_count']).to be > 0
    end
  end
end
