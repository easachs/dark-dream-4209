class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :complexity, presence: true
  validates :genre, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def self.alphabetical
    order(:name)
  end

  def total_cost
    # ingredients.sum(&:cost)
    ingredients.sum('cost')
  end
end