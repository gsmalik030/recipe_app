class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @food_recipe = FoodRecipe.new(recipe: @recipe)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  def create
    @recipe = Recipe.new(recipe_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
        format.js { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.public
      @recipe.update(public: false)
      flash[:notice] = 'You have update the recipe status to private'
    else
      @recipe.update(public: true)
      flash[:notice] = 'You have update the recipe status to public'
    end
    redirect_to recipes_path
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.food_recipes.destroy_all
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    recipe = params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    recipe[:user_id] = current_user.id
    recipe
  end

  def food_recipe_params
    params.require(:food_recipe).permit(:food_id, :recipe_id, :quantity)
  end

  def public_recipes
    @recipes = Recipe.where(public: true).includes(:user, :foods)
  end
end
