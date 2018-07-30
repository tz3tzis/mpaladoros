class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|

    	t.reference :stadium_id  #! stadiums will be added here! 
    	t.reference :team_id  
      t.datetime :starts_at
    

      t.timestamps

    end
  end
end
