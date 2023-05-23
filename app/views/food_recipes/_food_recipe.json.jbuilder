json.extract! food_recipe, :id, :quantity, :created_at, :updated_at
json.url food_recipe_url(food_recipe, format: :json)
