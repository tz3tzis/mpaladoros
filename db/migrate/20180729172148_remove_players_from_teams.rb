class RemovePlayersFromTeams < ActiveRecord::Migration[5.1]
  def change
    remove_column :teams, :players, :string
  end
end
