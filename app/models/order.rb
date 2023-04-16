class Order < ApplicationRecord
  belongs_to :shop_owner
  has_many_attached :documents
end
