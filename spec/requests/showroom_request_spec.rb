require 'rails_helper'

RSpec.describe "Showrooms", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/showroom/index"
      expect(response).to have_http_status(:success)
    end
  end

end
