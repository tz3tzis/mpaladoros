class AddForeignKeysToGameTeams < ActiveRecord::Migration[5.1]
  def change
  	remove_column :games, :hometeam_name
  	remove_column :games, :awayteam_name

  	add_column :games, :hometeam_id, :integer
  	add_column :games, :awayteam_id, :integer

  
  end
end
