class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def sender?(a_user)
    user.id == a_user.id
  end

  def joined_users
    [chatroom.match.teach_skill_1.user, chatroom.match.teach_skill_2.user]
  end
end
