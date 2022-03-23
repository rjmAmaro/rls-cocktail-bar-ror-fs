require "application_system_test_case"

class CocktailsTest < ApplicationSystemTestCase
  setup do
    @category = categories(:first)
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @cocktail = cocktails(:first)
>>>>>>> UI_03
=======
    @cocktail = cocktails(:first)
    @ingredient = ingredients(:first)
>>>>>>> UI_11
  end

  test "List categories" do
    visit categories_path
    assert_selector "h1", text: "Categories"
  end

<<<<<<< HEAD
<<<<<<< HEAD
  # test "List all cocktails from a category" do  end
=======
=======
>>>>>>> UI_11
  test "List all cocktails from a category" do
    visit categories_path
    assert_selector "h1", text: "Categories"

    click_on @category.name
    assert_text @cocktail.name
  end
<<<<<<< HEAD
>>>>>>> UI_03
=======
>>>>>>> UI_11

  # test "List searched cocktails from a category" do  end

  # test "Create a new cocktail" do  end

<<<<<<< HEAD
  # test "List cocktail title in cocktail page" do  end

  # test "List cocktail description in cocktail page" do  end

  # test "List cocktail photo in cocktail page" do  end
=======
  test "List cocktail page" do

    visit categories_path
    assert_selector "h1", text: "Categories"

    click_on @category.name
    assert_text @cocktail.name

    click_on @cocktail.name
    assert_text @cocktail.name.titleize
    assert_text @cocktail.instructions
    assert_text @ingredient.name.capitalize
  end
>>>>>>> UI_11

  # test "Add favourite to the cocktail" do  end

  # test "Remove favourite from the cocktail" do  end

  # test "Add cocktail review" do  end

  # test "Modify cocktail review" do  end

  # test "Remove cocktail review" do  end

  # test "List searched ingredients from a cocktail" do  end

  # test "List all ingredients from a cocktail" do  end

  # test "List ingredient title in ingredient page" do  end

  # test "List ingredient description in ingredient page" do  end

  # test "List ingredient photo in ingredient page" do  end
end
