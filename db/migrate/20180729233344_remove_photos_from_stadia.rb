class RemovePhotosFromStadia < ActiveRecord::Migration[5.1]
  def change
    remove_column :stadia, :photos, :text
  end
end
