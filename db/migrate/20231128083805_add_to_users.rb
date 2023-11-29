class AddToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string;
    add_column :users, :age, :integer;
    add_column :users, :gender, :string;
    add_column :users, :city, :string;
    add_column :users, :bio, :text;
    add_column :users, :availibility, :string;
  end
end
