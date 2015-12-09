class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :location, :string
    add_column :users, :age, :integer
    add_column :users, :food_choice, :string
    add_column :users, :bio, :text
    add_column :users, :interested_in, :string
    add_column :users, :avatar, :string
  end
end
