class Food < ApplicationRecord
  has_rich_text :body
  acts_as_list scope: :list

  belongs_to :list

  has_many :reviews

  validates_presence_of :name, {minimum: 5, maximum: 30}
end
