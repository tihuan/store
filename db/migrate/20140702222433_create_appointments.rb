class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :date
      t.string :hour
      t.string :complete, default: "F"
      t.belongs_to :account
      t.belongs_to :service

      t.timestamps
    end
  end
end
