class CreateLearnSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :learn_skills do |t|

      t.timestamps
    end
  end
end
