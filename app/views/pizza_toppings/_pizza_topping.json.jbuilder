json.extract! pizza_topping, :pizza_id, :topping_id, :created_at, :updated_at
json.url pizza_topping_url(pizza_topping, format: :json)
