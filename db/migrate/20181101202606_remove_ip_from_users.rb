class RemoveIpFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :ip, :inet
    add_column :users, :ip_address, :string
  end
end
