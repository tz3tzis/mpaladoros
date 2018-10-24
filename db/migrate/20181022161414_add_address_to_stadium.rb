class AddAddressToStadium < ActiveRecord::Migration[5.1]
  def change
    add_column :stadia, :address, :string
  end
end
