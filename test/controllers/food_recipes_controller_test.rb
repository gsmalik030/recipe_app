require 'test_helper'

class FoodRecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_recipe = food_recipes(:one)
  end

  test 'should get index' do
    get food_recipes_url
    assert_response :success
  end

  test 'should get new' do
    get new_food_recipe_url
    assert_response :success
  end

  test 'should create food_recipe' do
    assert_difference('FoodRecipe.count') do
      post food_recipes_url, params: { food_recipe: { quantity: @food_recipe.quantity } }
    end

    assert_redirected_to food_recipe_url(FoodRecipe.last)
  end

  test 'should show food_recipe' do
    get food_recipe_url(@food_recipe)
    assert_response :success
  end

  test 'should get edit' do
    get edit_food_recipe_url(@food_recipe)
    assert_response :success
  end

  test 'should update food_recipe' do
    patch food_recipe_url(@food_recipe), params: { food_recipe: { quantity: @food_recipe.quantity } }
    assert_redirected_to food_recipe_url(@food_recipe)
  end

  test 'should destroy food_recipe' do
    assert_difference('FoodRecipe.count', -1) do
      delete food_recipe_url(@food_recipe)
    end

    assert_redirected_to food_recipes_url
  end
end
