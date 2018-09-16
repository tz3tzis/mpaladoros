class AddAwayTeamToGames < ActiveRecord::Migration[5.1]
  def change
  	remove_foreign_key :players , :teams
    remove_foreign_key :stadia , :admins
  	

  	add_column :games , :awayteam_name , :string
  	add_column :games , :hometeam_name , :string

  	


  end
end
