class AddForeignKeysGame < ActiveRecord::Migration[5.1]
  def change
  	 add_reference :stadia, :game, foreign_key: true

    add_reference :teams, :game, foreign_key: true

  end
end
