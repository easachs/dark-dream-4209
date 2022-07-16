require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'instance methods' do
    it 'has total cost' do
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

      expect(paella.total_cost).to eq(30)
      expect(pizza.total_cost).to eq(12)
    end
  end

  describe 'class methods' do
    it 'can sort alphabetically' do
      pizza = Recipe.create!(name: "Pizza", complexity: 3, genre: "Hawaiian")
      paella = Recipe.create!(name: "Paella", complexity: 4, genre: "Spanish")
      bbq = Recipe.create!(name: "BBQ", complexity: 5, genre: "Murican")

      expect(Recipe.all.first).to eq(pizza)
      expect(Recipe.all[1]).to eq(paella)
      expect(Recipe.all.last).to eq(bbq)

      expect(Recipe.alphabetical.first).to eq(bbq)
      expect(Recipe.alphabetical[1]).to eq(paella)
      expect(Recipe.alphabetical.last).to eq(pizza)
    end
  end
end
