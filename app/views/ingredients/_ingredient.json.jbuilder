json.extract! ingredient, :id, :food_id, :quantity, :unit, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)