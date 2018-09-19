class RemoveUsernameFromAdmins < ActiveRecord::Migration[5.1]
  def change
  	remove_column :admins , :username
  	add_column :admins , :email , :string
  end
end
