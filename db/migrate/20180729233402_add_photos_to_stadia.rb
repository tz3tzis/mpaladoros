class AddPhotosToStadia < ActiveRecord::Migration[5.1]
  def change
    add_column :stadia, :photos, :string
  end
end
