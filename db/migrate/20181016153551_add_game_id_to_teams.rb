class AddGameIdToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :game_id, :integer
  end
end
