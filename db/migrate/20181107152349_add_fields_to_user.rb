class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :position, :string
  	add_column :users, :phone, :string
  	add_column :users, :location, :string
  	add_column :users, :birthday, :date
  	add_column :users, :teamgr, :string
  	add_column :users, :teameu, :string
  	add_column :users, :games_created, :integer
  	add_column :users, :games_played, :integer
  	add_column :users, :likes, :integer
  end
end
