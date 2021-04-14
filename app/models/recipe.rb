class Recipe < ApplicationRecord
  has_many :ingredients
  validates :name, presence: true

  def ingredient_ids=(ids)
    self.ingredients.clear # clears previous ids
    ids.each do |id| # loops through each id
      self.ingredients << Ingredient.find_by_id(id) unless id.empty? # associates ingredient if not empty
    end
  end
end
