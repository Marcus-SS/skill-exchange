class CreateTeachSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :teach_skills do |t|

      t.timestamps
    end
  end
end
