require 'rails_helper'

RSpec.describe ApiSlug::ApiKeysController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #reset" do
    it "returns http success" do
      get :reset
      expect(response).to have_http_status(:success)
    end
  end

end
