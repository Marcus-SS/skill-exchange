class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.joins(:messages).where('messages.user': current_user).uniq
  end

  def show
    @chatrooms = Chatroom.joins(:messages).where('messages.user': current_user).uniq
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
