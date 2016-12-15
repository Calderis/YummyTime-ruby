json.extract! user, :id, :name, :password, :image, :mail, :country, :week_id, :cookbook_count, :recipes_count
json.url users_url(user, format: :json)