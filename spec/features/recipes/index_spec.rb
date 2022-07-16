require 'rails_helper'

RSpec.describe 'recipe index' do
  it 'displays list of recipes with attributes' do
    paella = Recipe.create!(name: "Paella", complexity: 4, genre: "Spanish")
    pizza = Recipe.create!(name: "Pizza", complexity: 3, genre: "Hawaiian")

    visit '/recipes'

    expect(page).to have_content('Name: Paella')
    expect(page).to have_content('Complexity: 4')
    expect(page).to have_content('Genre: Spanish')

    expect(page).to have_content('Name: Pizza')
    expect(page).to have_content('Complexity: 3')
    expect(page).to have_content('Genre: Hawaiian')
  end

# User Story 1 of 4
# As a visitor,
# When I visit '/recipes',
# I see a list of recipes with the following information:
# -Name
# -Complexity
# -Genre
# (e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")

  it 'sorts alphabetically' do
    pizza = Recipe.create!(name: "Pizza", complexity: 3, genre: "Hawaiian")
    paella = Recipe.create!(name: "Paella", complexity: 4, genre: "Spanish")
    bbq = Recipe.create!(name: "BBQ", complexity: 5, genre: "Murican")

    visit '/recipes'

    within '#recipe_0' do
      expect(page).to have_content('Name: BBQ')
      expect(page).to have_content('Complexity: 5')
      expect(page).to have_content('Genre: Murican')
    end

    within '#recipe_1' do
      expect(page).to have_content('Name: Paella')
      expect(page).to have_content('Complexity: 4')
      expect(page).to have_content('Genre: Spanish')
    end

    within '#recipe_2' do  
      expect(page).to have_content('Name: Pizza')
      expect(page).to have_content('Complexity: 3')
      expect(page).to have_content('Genre: Hawaiian')
    end
  end
end

# User Story Extension
# On all index pages, all information is listed alphabetically.
