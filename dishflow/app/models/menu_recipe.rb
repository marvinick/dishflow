class MenuRecipe < ApplicationRecord
  belongs_to :menu, optional: true
  belongs_to :recipe, optional: true
end
