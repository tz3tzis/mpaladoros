class AddIdsToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :player_id, :integer
    add_column :teams, :team_id, :integer
  end
end
