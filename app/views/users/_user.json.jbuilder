json.extract! user, :id, :name, :password, :image, :mail, :country, :week_id, :cookbook_count, :recipes_count
json.url user_url(user, format: :json)