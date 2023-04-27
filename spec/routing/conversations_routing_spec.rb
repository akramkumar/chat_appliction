require "rails_helper"

RSpec.describe "routes for Conversations", type: :routing do
  describe "GET conversations/:user_id" do
    it "routes to conversations#show" do
      expect(get("/conversations/1")).to route_to("conversations#show", user_id: "1")
    end
  end

  describe "GET conversations/:search" do
    it "routes to conversations#index" do
      expect(get("/conversations/testcase")).to route_to("conversations#index", search: "testcase")
    end
  end
  describe "GET conversations/" do
    it "routes to conversations#index" do
      expect(get("/conversations/")).to route_to("conversations#index")
    end
  end
end
