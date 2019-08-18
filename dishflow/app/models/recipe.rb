class Recipe < ApplicationRecord
  has_many :menu_recipes
  has_many :menus, through: :menu_recipes

  has_rich_text :body

  validates_presence_of :name, {minimum: 5, maximum: 30}
end
