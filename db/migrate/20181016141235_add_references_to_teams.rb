class AddReferencesToTeams < ActiveRecord::Migration[5.1]
  def change
  	remove_column :games, :hometeam_id
  	remove_column :games, :awayteam_id

  	add_column :teams, :hometeam_id, :integer
  	add_column :teams, :awayteam_id, :integer
  end
end
