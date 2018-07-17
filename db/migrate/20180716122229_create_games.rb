class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|

    	t.string :stadium  #! stadiums will be added here!   
      t.datetime :starts_at
    	t.string :team_a
    	t.string :team_b

      t.timestamps

    end
  end
end
