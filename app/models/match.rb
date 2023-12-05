class Match < ApplicationRecord
  belongs_to :learn_skill_1, class_name: 'LearnSkill', foreign_key: "learn_skill_1_id"
  belongs_to :learn_skill_2, class_name: 'LearnSkill', foreign_key: "learn_skill_2_id"
  belongs_to :teach_skill_1, class_name: 'TeachSkill', foreign_key: "teach_skill_1_id"
  belongs_to :teach_skill_2, class_name: 'TeachSkill', foreign_key: "teach_skill_2_id"

  has_one :chatroom, dependent: :destroy
  validates :teach_skill_1, uniqueness: { scope: :teach_skill_2 }

  def users
    [learn_skill_1.user, learn_skill_2.user]
  end

  def other_user(user)
    users.find { |el| el != user }
  end
end
