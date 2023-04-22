class RemoveUniqueConstraintFromOrdersPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    remove_index :orders, :phone_number
    add_index :orders, :phone_number
  end
end
