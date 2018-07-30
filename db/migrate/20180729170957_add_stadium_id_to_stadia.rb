class AddStadiumIdToStadia < ActiveRecord::Migration[5.1]
  def change
    add_column :stadia, :stadium_id, :integer
  end
end
