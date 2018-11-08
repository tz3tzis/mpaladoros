class AddFielToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :height, :float
    add_column :users, :weight, :float
  end
end
