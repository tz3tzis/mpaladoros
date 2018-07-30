class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.float :longitude
      t.float :latitude
      t.integer :points
      t.string :mail
      t.integer :MVP
      t.string :photos
      t.float :carma
      t.string :username
      t.integer :games_played

      t.timestamps
    end
  end
end
