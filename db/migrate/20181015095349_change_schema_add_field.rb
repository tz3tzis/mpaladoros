class ChangeSchemaAddField < ActiveRecord::Migration[5.1]
  def change
  	remove_column :stadia, :game_id
  	remove_column :stadia, :stadium_id
  	remove_column :stadia, :photos

  	add_column :games, :stadium_id, :integer
  end
end
