class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.joins(:messages).where('messages.user': current_user).uniq
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.match = Match.find(params[:match_id])
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
