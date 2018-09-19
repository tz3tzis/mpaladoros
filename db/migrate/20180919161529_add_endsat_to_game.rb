class AddEndsatToGame < ActiveRecord::Migration[5.1]
  def change
  	add_column :games , :ends_at , :datetime
  end
end
