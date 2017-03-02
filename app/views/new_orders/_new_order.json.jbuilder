json.extract! new_order, :id, :sauce_name, :quantity, :destination, :created_at, :updated_at
json.url new_order_url(new_order, format: :json)
