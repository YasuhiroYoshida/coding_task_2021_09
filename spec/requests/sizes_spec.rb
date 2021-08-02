require 'rails_helper'

RSpec.describe "Sizes", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/sizes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /convert" do
    it "returns http success" do
      get "/sizes/convert"
      expect(response).to have_http_status(:success)
    end
  end

end
