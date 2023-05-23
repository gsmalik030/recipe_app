class AddFoodToFoodRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_recipes, :food, index:true, foreign_key: true
  end
end
