class AddAge < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :birthday, :date
  	add_column :users, :age, :integer
  end
end
