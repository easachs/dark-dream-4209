require 'rails_helper'

RSpec.describe 'recipe show' do
  it 'displays recipe name and ingredients' do
    paella = Recipe.create!(name: "Paella", complexity: 4, genre: "Spanish")
    pizza = Recipe.create!(name: "Pizza", complexity: 3, genre: "Hawaiian")

    rice = Ingredient.create!(name: "Rice", cost: 9)
    saffron = Ingredient.create!(name: "Saffron", cost: 10)
    clams = Ingredient.create!(name: "Clams", cost: 11)
    dough = Ingredient.create!(name: "Dough", cost: 3)
    sauce = Ingredient.create!(name: "Sauce", cost: 4)
    pineapple = Ingredient.create!(name: "Pineapple", cost: 5)

    RecipeIngredient.create!(recipe: paella, ingredient: rice)
    RecipeIngredient.create!(recipe: paella, ingredient: saffron)
    RecipeIngredient.create!(recipe: paella, ingredient: clams)
    RecipeIngredient.create!(recipe: pizza, ingredient: dough)
    RecipeIngredient.create!(recipe: pizza, ingredient: sauce)
    RecipeIngredient.create!(recipe: pizza, ingredient: pineapple)

    visit "/recipes/#{paella.id}"

    expect(page).to have_content('Paella')
    expect(page).to have_content('Rice')
    expect(page).to have_content('Saffron')
    expect(page).to have_content('Clams')
    expect(page).to_not have_content('Pizza')
    expect(page).to_not have_content('Dough')
    expect(page).to_not have_content('Sauce')
    expect(page).to_not have_content('Pineapple')
  end

# User Story 2 of 4
# As a visitor,
# When I visit '/recipes/:id'
# I see a list of the names of the ingredients the recipe has.
# (e.g. "Pasta, Meat, Cheese")

  it 'has total cost of ingredients' do
    paella = Recipe.create!(name: "Paella", complexity: 4, genre: "Spanish")
    pizza = Recipe.create!(name: "Pizza", complexity: 3, genre: "Hawaiian")

    rice = Ingredient.create!(name: "Rice", cost: 9)
    saffron = Ingredient.create!(name: "Saffron", cost: 10)
    clams = Ingredient.create!(name: "Clams", cost: 11)
    
    dough = Ingredient.create!(name: "Dough", cost: 3)
    sauce = Ingredient.create!(name: "Sauce", cost: 4)
    pineapple = Ingredient.create!(name: "Pineapple", cost: 5)

    RecipeIngredient.create!(recipe: paella, ingredient: rice)
    RecipeIngredient.create!(recipe: paella, ingredient: saffron)
    RecipeIngredient.create!(recipe: paella, ingredient: clams)
    RecipeIngredient.create!(recipe: pizza, ingredient: dough)
    RecipeIngredient.create!(recipe: pizza, ingredient: sauce)
    RecipeIngredient.create!(recipe: pizza, ingredient: pineapple)

    visit "/recipes/#{paella.id}"

    expect(page).to have_content('Total Cost: 30')

    visit "/recipes/#{pizza.id}"

    expect(page).to have_content('Total Cost: 12')
  end

end

# User Story 4 of 4
# As a visitor,
# When I visit '/recipes/:id'
# I see the total cost of all of the ingredients in the recipe.
# (e.g. "Total Cost: 22")