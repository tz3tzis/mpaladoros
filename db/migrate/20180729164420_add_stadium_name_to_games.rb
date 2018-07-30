class AddStadiumNameToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :stadium_name, :string
    add_column :games, :team_name, :string
  end
end
