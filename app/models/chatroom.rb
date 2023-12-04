class Chatroom < ApplicationRecord
  belongs_to :match
  has_many :messages

  validates :match_id, presence: true, uniqueness: true

  def last_message_time
    messages.last.created_at
  end
end
