class Menu < ApplicationRecord
  has_rich_text :body
  validates_presence_of :name, {minimum: 5, maximum: 30}

  has_many :lists
  has_many :menu_recipes
  has_many :recipes, through: :menu_recipes
  has_many :reviews
  has_many :ratings
  accepts_nested_attributes_for :ratings, allow_destroy: true
end
