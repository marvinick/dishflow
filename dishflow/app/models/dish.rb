class Dish < ApplicationRecord
  acts_as_list scope: :menu

  belongs_to :menu

  validates :name, presence: true
end
