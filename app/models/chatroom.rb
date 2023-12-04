class Chatroom < ApplicationRecord
  belongs_to :match
  has_many :messages

  validates :match_id, presence: true, uniqueness: true
end
