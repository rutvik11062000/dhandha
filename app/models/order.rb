class Order < ApplicationRecord

  self.per_page = 10
  belongs_to :shop_owner
  has_many_attached :documents
  has_many :order_items, dependent: :destroy
  has_many :receipts, dependent: :destroy
  has_one :bill , dependent: :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true, reject_if: :all_blank

  def total_item_amount
    order_items.map(&:amount).sum
  end

  def total_receipt_amount
    receipts.map(&:amount).sum
  end

  def balance
    total_item_amount - total_receipt_amount
  end
end
