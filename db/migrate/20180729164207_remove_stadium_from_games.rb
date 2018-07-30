class RemoveStadiumFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :stadium, :string
  end
end
