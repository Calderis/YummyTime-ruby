json.extract! recipe, :id, :persons_amount, :description, :image, :type_menu, :count, :author_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)