require 'rails_helper'

RSpec.describe "Messages", type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create!(name: "Testcase",email: "Testcase@gmail.com",password: "123456") }
  let(:user1) { User.create!(name: "Testcase1",email: "Testcase1@gmail.com",password: "123456") }
  let(:conversation) { Conversation.create!(user1_id: user.id, user2_id: user1.id) }
  before do
    sign_in user
  end

  describe "Post #create" do
    it "create a new message" do
      post :"/conversations/#{conversation.id}/messages.js", params: { message: { body: "Hello!", conversation_id: conversation.id, user_id: user.id } }
      expect(response).to have_http_status(:success)
    end

  end

end
