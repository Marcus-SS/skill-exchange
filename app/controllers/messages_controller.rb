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
        chatrooms: render_to_string(partial: "chatrooms/chatrooms", locals: { chatrooms: current_user.chatrooms }),
        sender_id: @message.user.id
      )
      notify_recipient
      set_message_notifications_as_read
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def notify_recipient
    users_in_room = @message.joined_users
    users_in_room.each do |user|
      next if user.eql?(current_user)

      notification = MessageNotification.with(message: @message.content, chatroom: @message.chatroom, type: "message")
      notification.deliver(user)
    end
  end

  def set_message_notifications_as_read
    notifications = @chatroom.notifications_as_chatroom.where(recipient: current_user).unread
    notifications.update_all(read_at: Time.zone.now)
  end

  # def set_chatroom
  #   @chatroom = Chatroom.find(params[:chatroom_id])
  #   # Optional: Add authorization check to ensure user is part of the match
  # end

  def message_params
    params.require(:message).permit(:content)
  end
end
