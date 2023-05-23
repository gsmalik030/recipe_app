require "application_system_test_case"

class FoodRecipesTest < ApplicationSystemTestCase
  setup do
    @food_recipe = food_recipes(:one)
  end

  test "visiting the index" do
    visit food_recipes_url
    assert_selector "h1", text: "Food recipes"
  end

  test "should create food recipe" do
    visit food_recipes_url
    click_on "New food recipe"

    fill_in "Quantity", with: @food_recipe.quantity
    click_on "Create Food recipe"

    assert_text "Food recipe was successfully created"
    click_on "Back"
  end

  test "should update Food recipe" do
    visit food_recipe_url(@food_recipe)
    click_on "Edit this food recipe", match: :first

    fill_in "Quantity", with: @food_recipe.quantity
    click_on "Update Food recipe"

    assert_text "Food recipe was successfully updated"
    click_on "Back"
  end

  test "should destroy Food recipe" do
    visit food_recipe_url(@food_recipe)
    click_on "Destroy this food recipe", match: :first

    assert_text "Food recipe was successfully destroyed"
  end
end
