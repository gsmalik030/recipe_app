class AddRecipeToFoodRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_recipes, :recipe, index:true, foreign_key: true

  end
end
