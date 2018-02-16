require 'json'
require 'open-uri'

Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

for i in (0..2)
  ing = ingredient["drinks"][i]["strIngredient1"]
  Ingredient.create(name: "#{ing}")
end

cocktail = Cocktail.create(name: "Test-cocktail")

puts "Finished"





