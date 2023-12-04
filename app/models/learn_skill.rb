class LearnSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :matches, foreign_key: "learn_skill_1_id", dependent: :destroy
  has_many :matches, foreign_key: "learn_skill_2_id", dependent: :destroy

  validates :user_id, uniqueness: { scope: :skill_id }
  validates :skill_id, uniqueness: { scope: :user_id }
end
