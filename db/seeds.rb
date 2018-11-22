require "open-uri"
require "json"
require 'faker'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
json = JSON.parse(ingredient_serialized)
ingredients = json["drinks"]

ingredients.each do |ingredient|
  Ingredient.create(
    name: ingredient["strIngredient1"]
  )
end

puts 'Creating 5 fake cocktails...'
5.times do
  Cocktail.create!(
  name: "\"The #{Faker::Hipster.word}\"",
  )
end
puts 'Finished!'
