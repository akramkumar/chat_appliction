require 'rails_helper'

RSpec.describe "Conversations", type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create!(name: "Testcase",email: "Testcase@gmail.com",password: "123456") }


  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get "/conversations/"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /search" do
    it "returns http success" do
      get "/conversations/testcase"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /show" do
    it "returns http success" do
      get "/conversations/1"
      expect(response).to have_http_status(:success)
    end
  end

end
