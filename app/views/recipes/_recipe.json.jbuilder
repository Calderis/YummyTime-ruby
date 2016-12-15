json.extract! recipe, :id, :persons_amount, :name, :description, :image, :type_menu, :count_time, :user_id, :image_thumb, :image_medium
json.url recipe_url(recipe, format: :json)