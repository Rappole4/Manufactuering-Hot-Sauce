json.extract! order, :id, :sauce_name, :quantity, :destination, :created_at, :updated_at
json.url order_url(order, format: :json)
