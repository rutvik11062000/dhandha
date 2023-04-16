class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :phone_number, limit: 10
      t.references :shop_owner, null: false, foreign_key: true
      t.string :company

      t.timestamps
    end
    add_index :orders, :phone_number, unique: true
  end
end
