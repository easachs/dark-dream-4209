# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

paella = Recipe.create!(name: "Paella", complexity: 4, genre: "Spanish")
pizza = Recipe.create!(name: "Pizza", complexity: 3, genre: "Hawaiian")

rice = Ingredient.create!(name: "Rice", cost: 9)
saffron = Ingredient.create!(name: "Saffron", cost: 10)
clams = Ingredient.create!(name: "Clams", cost: 11)
dough = Ingredient.create!(name: "Dough", cost: 3)
sauce = Ingredient.create!(name: "Sauce", cost: 4)
pineapple = Ingredient.create!(name: "Pineapple", cost: 5)

salt = Ingredient.create!(name: "Salt", cost: 1)

kimchi = Ingredient.create!(name: "Kimchi", cost: 3)

RecipeIngredient.create!(recipe: paella, ingredient: rice)
RecipeIngredient.create!(recipe: paella, ingredient: saffron)
RecipeIngredient.create!(recipe: paella, ingredient: clams)
RecipeIngredient.create!(recipe: pizza, ingredient: dough)
RecipeIngredient.create!(recipe: pizza, ingredient: sauce)
RecipeIngredient.create!(recipe: pizza, ingredient: pineapple)

RecipeIngredient.create!(recipe: pizza, ingredient: salt)
RecipeIngredient.create!(recipe: paella, ingredient: salt)
