class AddKeysToModels < ActiveRecord::Migration[5.1]
  def change
  	add_column :stadia, :game_id, :integer
  end
end
