class AddStadiumRefToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :stadium, foreign_key: true
  end
end
