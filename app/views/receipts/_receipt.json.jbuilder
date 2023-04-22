json.extract! receipt, :id, :order_id, :payment_method, :amount, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
