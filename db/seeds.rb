require 'open-uri'
require 'json'
require 'faker'

Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

url =  "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
parseo = open(url).read
result = JSON.parse(parseo)["drinks"]
result.sample(5).each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  p "ingredient created"
end

8.times do
  Cocktail.create!(name: Faker::Superhero.power + " cocktail")
  p "cocktail created"
end
