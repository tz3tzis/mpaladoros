class AddIdsToGames < ActiveRecord::Migration[5.1]
  def change
  	remove_column :games, :stadium_name
  	add_column :games, :admin_id, :integer
  end
end
