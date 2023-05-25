class PublicRecipeController < ApplicationController
    def index
       @public_recipes = Recipe.includes(:food_recipes, :user).where(public: true) 
    end
end
