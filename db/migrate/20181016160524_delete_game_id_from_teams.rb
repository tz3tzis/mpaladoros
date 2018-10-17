class DeleteGameIdFromTeams < ActiveRecord::Migration[5.1]
  def change
  	remove_column :teams, :game_id
  end
end
