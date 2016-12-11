json.extract! food, :id, :name, :image, :count_time, :created_at, :updated_at
json.url food_url(food, format: :json)