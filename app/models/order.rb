class Order < ApplicationRecord
  belongs_to :shop_owner
  has_many_attached :documents
  has_many :order_items, dependent: :destroy
end
