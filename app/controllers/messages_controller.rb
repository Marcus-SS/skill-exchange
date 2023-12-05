class MessagesController < ApplicationController
  # before_action :set_chatroom

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        message: render_to_string(partial: "message", locals: { message: @message }),
        chatrooms: render_to_string(partial: "chatrooms/chatrooms", locals: { chatrooms: current_user.chatrooms_with_messages }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  # def set_chatroom
  #   @chatroom = Chatroom.find(params[:chatroom_id])
  #   # Optional: Add authorization check to ensure user is part of the match
  # end

  def message_params
    params.require(:message).permit(:content)
  end
end
