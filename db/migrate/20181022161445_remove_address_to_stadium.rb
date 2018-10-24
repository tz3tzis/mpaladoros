class RemoveAddressToStadium < ActiveRecord::Migration[5.1]
  def change
    remove_column :stadia, :adress, :string
  end
end
