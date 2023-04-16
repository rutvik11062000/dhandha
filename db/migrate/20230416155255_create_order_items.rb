class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :product_id
      t.integer :qty
      t.integer :amount

      t.timestamps
    end
    add_index :order_items, :product_id
  end
end
