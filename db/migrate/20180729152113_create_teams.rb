class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
    
      t.string :name
      t.integer :capacity
      t.string :player_id

      t.timestamps
    end
    	add_index :teams , :name
  end
end
