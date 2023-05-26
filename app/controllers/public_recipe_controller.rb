class PublicRecipeController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:food_recipes, :user).where(public: true).order(id: :desc)
  end
end
