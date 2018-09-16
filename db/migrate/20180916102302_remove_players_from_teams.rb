class RemovePlayersFromTeams < ActiveRecord::Migration[5.1]
  def change

  	remove_column :teams , :player_id
  	remove_column :teams , :team_id
  	remove_column :stadia , :admin_id
  	remove_column :players , :teams_id
  	remove_column :games , :team_name

  end
end
