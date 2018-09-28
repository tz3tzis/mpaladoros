class AddStringToStadia < ActiveRecord::Migration[5.1]
  def change
  	remove_column :stadia, :photos
    add_column :stadia, :photos, :string
  end
end
