# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Category.all.delete_all

categories = RestClient.get 'https://thecocktaildb.com/api/json/v1/1/list.php?c=list'
parsed_categories = JSON.parse(categories.body)['drinks']

parsed_categories.each do |category|
  new_category = Category.create(name: category['strCategory'])

  drinks = RestClient.get "https://thecocktaildb.com/api/json/v1/1/filter.php?c=#{new_category.name.gsub(' ', '_')}"
  parsed_drinks = JSON.parse(drinks.body)['drinks']
  #puts 'BORA'
  parsed_drinks.each do |drink|

    drink_info = RestClient.get "www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink['idDrink']}"
    #puts drink['idDrink']
    parsed_drink_info = JSON.parse(drink_info.body)['drinks'][0]

    cocktail = Cocktail.create(name: parsed_drink_info['strDrink'], picture: parsed_drink_info['strDrinkThumb'], instructions: parsed_drink_info['strInstructions'], category: new_category)



    #puts parsed_drink_info['strDrink']

    i = 1
    while true
      str = "strIngredient#{i}"

      break unless parsed_drink_info[str].is_a?(String)

      if parsed_drink_info[str] == "J\u00E4germeister"
        ing = RestClient.get("www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=278")
      elsif parsed_drink_info[str] == "A\u00F1ejo rum"
        ing = RestClient.get("www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=37")
      else
        ing = RestClient.get "www.thecocktaildb.com/api/json/v1/1/search.php?i=#{parsed_drink_info[str].gsub(' ', '_').downcase}"
      end

      unless JSON.parse(ing.body)["ingredients"]
        i += 1
        next
      end

      parsed_ing = JSON.parse(ing.body)["ingredients"][0]

      ingredient = Ingredient.find_by(name: parsed_ing["strIngredient"])

      if ingredient.nil?

        if parsed_ing["strDescription"]
          desc = parsed_ing["strDescription"]
        else
          desc = 'Wow. Such empty.'
        end

        ingredient = Ingredient.create(name: parsed_ing["strIngredient"], description: desc, picture: "www.thecocktaildb.com/images/ingredients/#{parsed_ing['strIngredient'].gsub(' ', '_').downcase}-Medium.png")
        ingredient.save
      end

      cocktail.ingredients.push ingredient

      #puts ingredient.name

      i += 1
    end
  end
end

# Get ingredients from CocktailDB API

# ingredients = RestClient.get 'www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# parsed_ingredients = JSON.parse(ingredients.body)['drinks']
#
# parsed_ingredients.each do |ingredient|
#
#   #puts ingredient['strIngredient1'].gsub(' ', '_').downcase
#
#   if ingredient['strIngredient1'] == "J\u00E4germeister"
#     ing = RestClient.get("www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=278")
#   elsif ingredient['strIngredient1'] == "A\u00F1ejo rum"
#     ing = RestClient.get("www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=37")
#   else
#     ing = RestClient.get "www.thecocktaildb.com/api/json/v1/1/search.php?i=#{ingredient['strIngredient1'].gsub(' ', '_').downcase}"
#   end
#
#   parsed_ing = JSON.parse(ing.body)['ingredients'][0]
#
#   ingred = Ingredient.create(name: parsed_ing['strIngredient'].capitalize, description: parsed_ing['strDescription'], picture: "www.thecocktaildb.com/images/ingredients/#{parsed_ing['strIngredient'].downcase}-Medium.png")
#
# end


