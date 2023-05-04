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
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    if @conversation.user1_id == current_user.id
      redirect_to("/conversations/#{@conversation.user2_id}")
    else
      redirect_to("/conversations/#{@conversation.user1_id}")
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
