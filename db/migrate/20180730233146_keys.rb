class Keys < ActiveRecord::Migration[5.1]
  def change
  	remove_foreign_key :games, column: :stadium_id
  	remove_foreign_key :games, column: :team_id

  end

end
