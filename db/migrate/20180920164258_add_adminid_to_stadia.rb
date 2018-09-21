class AddAdminidToStadia < ActiveRecord::Migration[5.1]
  def change
  	add_column :stadia , :admin_id , :integer
  end
end
