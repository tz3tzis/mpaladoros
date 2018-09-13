class RemoveGamesFromStadia < ActiveRecord::Migration[5.1]
  def change
  		remove_foreign_key :stadia, :games
  	  remove_foreign_key :teams, :games
  end
end
