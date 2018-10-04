class AddToUser < ActiveRecord::Migration[5.1]
  def change
  	remove_column :players , :mail
  	remove_column :players , :username

  	add_column :players, :name, :string
  	add_column :players, :email, :string
  	add_column :players, :password, :string




  end
end
