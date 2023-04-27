require "rails_helper"

RSpec.describe "routes for messages", type: :routing do
  describe "post /conversations/1/messages" do
    it "routes to messages#create" do
      expect(post("/conversations/1/messages")).to route_to("messages#create", conversation_id: "1")
    end
  end
end
