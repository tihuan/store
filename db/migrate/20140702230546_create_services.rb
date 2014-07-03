class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.integer :price_in_cents
      t.string :currency, default: "USD"

      t.timestamps
    end
  end
end
