json.extract! user, :id, :name, :password, :image, :mail, :country, :week_id, :created_at, :updated_at
json.url user_url(user, format: :json)