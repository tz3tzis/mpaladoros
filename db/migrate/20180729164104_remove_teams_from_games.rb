class RemoveTeamsFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :team_a, :string
    remove_column :games, :team_b, :string
  end
end
