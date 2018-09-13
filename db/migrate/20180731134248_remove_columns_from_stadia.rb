class RemoveColumnsFromStadia < ActiveRecord::Migration[5.1]
  def change
  	remove_column :stadia, :games_id
  	remove_column :teams, :games_id

  end
end
