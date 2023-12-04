class Chatroom < ApplicationRecord
  belongs_to :match
  has_many :messages

  def last_message_time
    messages.last.created_at
  end
end
