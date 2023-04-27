class ConversationsController < ApplicationController
  before_action :user_find , :user_list
  def index
    if params[:search].present?
      if @users.find_by(email: params[:search])
        @users=@users.find_by(email: params[:search])
        @conversation=Conversation.includes(:messages).between_user(@user, @users)
        if @conversation[0]
        @message = @conversation[0].messages
        end
      else
        @users=nil
        @conversation=nil
        @message=nil
      end
    end

  end
  def create

  end
  def show
    @user1 = User.find(set_user[:user_id])
    @conversation = Conversation.includes(:messages).between_user(@user,@user1).first_or_create(user1_id: @user.id,user2_id: @user1.id)
    @message = Message.new
  end
  private
  def user_find
    @user = User.find(current_user.id)
  end
  def user_list
    @users = User.list_user(@user.id)
  end
  def set_user
    params.permit(:user_id)
  end
end
