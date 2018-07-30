class CreateStadia < ActiveRecord::Migration[5.1]
  def change
    create_table :stadia do |t|
      t.float :longitude
      t.float :latitude
      t.integer :open_at
      t.integer :max_players
      t.integer :stars
      t.float :price
      t.text :photos
      t.string :stadium_name

      t.timestamps
    end
    add_index :stadia, :stadium_name
  end
end
