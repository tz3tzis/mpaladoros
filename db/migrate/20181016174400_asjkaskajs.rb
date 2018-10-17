class Asjkaskajs < ActiveRecord::Migration[5.1]
  def change
  	remove_column :teams, :hometeam_id
  	remove_column :teams, :awayteam_id

  	add_column :games, :hometeam_id, :integer
  	add_column :games, :awayteam_id, :integer
  	
  end
end
