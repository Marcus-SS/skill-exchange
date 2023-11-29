class AddForeignKeyToLearnSkills < ActiveRecord::Migration[7.1]
  def change
    add_column :learn_skills, :user_id, :integer
    add_column :learn_skills, :skill_id, :integer

    add_foreign_key :learn_skills, :users, column: :user_id
    add_foreign_key :learn_skills, :skills, column: :skill_id
  end
end
