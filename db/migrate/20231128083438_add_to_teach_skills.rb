class AddToTeachSkills < ActiveRecord::Migration[7.1]
  def change
    add_column :teach_skills, :mode, :string
    add_column :teach_skills, :level, :string
  end
end
