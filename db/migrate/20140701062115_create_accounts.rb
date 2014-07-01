class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.string :phone
      t.date :birthdate
      t.string :email
      t.text :memo
      t.string :password_digest

      t.timestamps
    end
    add_index :accounts, :email, :unique => true
  end
end
