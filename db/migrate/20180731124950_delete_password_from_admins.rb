class DeletePasswordFromAdmins < ActiveRecord::Migration[5.1]
  def change
  	remove_column :admins, :password, :string
  end
end
