class Skill < ApplicationRecord
  has_many :teach_skills
  has_many :learn_skills

end
