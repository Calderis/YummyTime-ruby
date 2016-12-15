json.extract! user, :id, :name, :password, :image, :mail, :country, :week_id, :cookbook_count, :recipes_count, :image_thumb, :image_medium
json.url users_url(user, format: :json)