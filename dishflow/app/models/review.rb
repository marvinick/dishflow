class Review < ApplicationRecord
  belongs_to :food
  belongs_to :menu
  serialize :properties, Hash
end
