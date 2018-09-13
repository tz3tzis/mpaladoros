class AddGameRefToStadia < ActiveRecord::Migration[5.1]
  def change
    add_reference :stadia, :games, foreign_key: true

    add_reference :teams, :games, foreign_key: true

  end
end
