class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password
      t.string :telephone
      t.string :IBAN
      t.string :stadium_name

      t.timestamps
    end
  end
end
