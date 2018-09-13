class RemoveStadiumNameFromAdmins < ActiveRecord::Migration[5.1]
  def change
    remove_column :admins, :stadium_name, :string
  end
  
end
