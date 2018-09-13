class AddTeamRefToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :team, foreign_key: true
  end
end
