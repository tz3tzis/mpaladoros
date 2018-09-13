class GamesAttributesDelete < ActiveRecord::Migration[5.1]
  
	change_table :games do |t|
  	t.remove :team_id, :stadium_id
 	end

end
