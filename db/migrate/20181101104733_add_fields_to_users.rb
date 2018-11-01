class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ip, :inet
  end
end
