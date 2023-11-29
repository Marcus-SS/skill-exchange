class Match < ApplicationRecord
  belongs_to :learn_skill_1, class_name: 'LearnSkill', foreign_key: "learn_skill_1_id"
  belongs_to :learn_skill_2, class_name: 'LearnSkill', foreign_key: "learn_skill_2_id"
  belongs_to :teach_skill_1, class_name: 'TeachSkill', foreign_key: "teach_skill_1_id"
  belongs_to :teach_skill_2, class_name: 'TeachSkill', foreign_key: "teach_skill_2_id"
end
