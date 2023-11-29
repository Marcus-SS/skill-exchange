class AddForeignKeyToTeachSkills < ActiveRecord::Migration[7.1]
  def change

    add_column :teach_skills, :user_id, :integer
    add_column :teach_skills, :skill_id, :integer

    add_foreign_key :teach_skills, :users, column: :user_id
    add_foreign_key :teach_skills, :skills, column: :skill_id
  end
end
