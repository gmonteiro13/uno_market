json.extract! product, :id, :product_name, :category, :description, :price, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
