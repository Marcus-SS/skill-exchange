class RemoveNameFromChatrooms < ActiveRecord::Migration[7.1]
  def change
    remove_column :chatrooms, :name, :string
  end
end
