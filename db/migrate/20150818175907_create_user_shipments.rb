class CreateUserShipments < ActiveRecord::Migration
  def change
    create_table :user_shipments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :shipment, index: true, foreign_key: true
      t.string :role

      t.timestamps null: false
    end
  end
end
