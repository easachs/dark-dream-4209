require 'rails_helper'

RSpec.describe 'list of ingredients w number of recipes used in' do
  it 'displays list of recipes with attributes' do
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

    visit '/ingredients'

    expect(page).to have_content('Rice: 1')
    expect(page).to have_content('Saffron: 1')
    expect(page).to have_content('Clams: 1')
    expect(page).to have_content('Dough: 1')
    expect(page).to have_content('Sauce: 1')
    expect(page).to have_content('Pineapple: 1')
    expect(page).to have_content('Salt: 2')
    expect(page).to have_content('Kimchi: 0')
  end

# User Story 3 of 4
# As a visitor,
# When I visit '/ingredients'
# I see a list of ingredients and the number of recipes each ingredient is used in.
# (e.g. "Ground Beef: 2"
#      "Salt: 4")

  it 'sorts alphabetically' do
    pizza = Recipe.create!(name: "Pizza", complexity: 3, genre: "Hawaiian")
    paella = Recipe.create!(name: "Paella", complexity: 4, genre: "Spanish")

    dough = Ingredient.create!(name: "Dough", cost: 3)
    sauce = Ingredient.create!(name: "Sauce", cost: 4)
    pineapple = Ingredient.create!(name: "Pineapple", cost: 5)
    salt = Ingredient.create!(name: "Salt", cost: 1)

    RecipeIngredient.create!(recipe: pizza, ingredient: dough)
    RecipeIngredient.create!(recipe: pizza, ingredient: sauce)
    RecipeIngredient.create!(recipe: pizza, ingredient: pineapple)
    RecipeIngredient.create!(recipe: pizza, ingredient: salt)
    RecipeIngredient.create!(recipe: paella, ingredient: salt)

    visit '/ingredients'

    within '#ing_0' do
      expect(page).to have_content('Dough: 1')
    end

    within '#ing_1' do
      expect(page).to have_content('Pineapple: 1')
    end

    within '#ing_2' do
      expect(page).to have_content('Salt: 2')
    end

    within '#ing_3' do
      expect(page).to have_content('Sauce: 1')
    end
  end
end

# User Story Extension
# On all index pages, all information is listed alphabetically.