class RemoveIndexFromStadia < ActiveRecord::Migration[5.1]
  def change
  	remove_index "admin_id" , name: "index_stadia_on_admin_id"
  	remove_index "teams_id" , name: "index_players_on_teams_id"
  	remove_index "stadium_name" , name: "index_stadia_on_stadium_name"

  end
end
