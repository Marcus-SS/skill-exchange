class LearnSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :matches

  validates :user_id, uniqueness: { scope: :skill_id }
  validates :skill_id, uniqueness: { scope: :user_id }
end
