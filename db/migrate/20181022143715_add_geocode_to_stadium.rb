class AddGeocodeToStadium < ActiveRecord::Migration[5.1]
  def change
  	add_column :stadia, :latitude, :float
  	add_column :stadia, :longitude, :float
  end
end
