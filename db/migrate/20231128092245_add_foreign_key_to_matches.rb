class AddForeignKeyToMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :teach_skill_1_id, :integer
    add_column :matches, :teach_skill_2_id, :integer
    add_column :matches, :learn_skill_1_id, :integer
    add_column :matches, :learn_skill_2_id, :integer

    add_foreign_key :matches, :teach_skills, column: :teach_skill_1_id
    add_foreign_key :matches, :teach_skills, column: :teach_skill_2_id
    add_foreign_key :matches, :learn_skills, column: :learn_skill_1_id
    add_foreign_key :matches, :learn_skills, column: :learn_skill_2_id

  end
end
