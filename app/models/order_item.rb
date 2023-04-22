class OrderItem < ApplicationRecord
  belongs_to :order

  def name
    Product.find(product_id).name
  end
end
