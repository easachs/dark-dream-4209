require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'instance methods' do
    it 'has recipe count' do
      paella = Recipe.create!(name: "Paella", complexity: 4, genre: "Spanish")
      pizza = Recipe.create!(name: "Pizza", complexity: 3, genre: "Hawaiian")

      rice = Ingredient.create!(name: "Rice", cost: 9)

      pineapple = Ingredient.create!(name: "Pineapple", cost: 5)

      salt = Ingredient.create!(name: "Salt", cost: 1)

      RecipeIngredient.create!(recipe: paella, ingredient: rice)
      RecipeIngredient.create!(recipe: pizza, ingredient: pineapple)

      RecipeIngredient.create!(recipe: pizza, ingredient: salt)
      RecipeIngredient.create!(recipe: paella, ingredient: salt)

      expect(rice.recipe_count).to eq(1)
      expect(pineapple.recipe_count).to eq(1)
      expect(salt.recipe_count).to eq(2)
    end
  end

  describe 'class methods' do
    it 'can sort alphabetically' do
      rice = Ingredient.create!(name: "Rice", cost: 9)
      pineapple = Ingredient.create!(name: "Pineapple", cost: 5)
      salt = Ingredient.create!(name: "Salt", cost: 1)

      expect(Ingredient.all.first).to eq(rice)
      expect(Ingredient.all[1]).to eq(pineapple)
      expect(Ingredient.all.last).to eq(salt)

      expect(Ingredient.alphabetical.first).to eq(pineapple)
      expect(Ingredient.alphabetical[1]).to eq(rice)
      expect(Ingredient.alphabetical.last).to eq(salt)
    end
  end
end
