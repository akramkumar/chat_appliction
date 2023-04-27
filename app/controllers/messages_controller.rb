class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = @conversation.messages.new(set_params)
    @message.user_id=current_user.id
    respond_to do |format|
      if @message.save
        format.js
        end
    end
  end

  private
  def set_params
    params.require(:message).permit(:body)
  end
  def set_conversation
    @conversation=Conversation.find(params[:conversation_id])
  end

end
