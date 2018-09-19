class AddStarttimeToGames < ActiveRecord::Migration[5.1]
  def change
  	remove_column :games , :starts_at
  	remove_column :games , :ends_at

  	add_column :games , :start_time , :datetime
  	add_column :games , :end_time , :datetime
  	add_column :games , :name , :string
  	
  end
end
