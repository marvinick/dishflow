class List < ApplicationRecord
  acts_as_list

  belongs_to :menu
  has_many :foods, ->{ order(position: :asc) }, dependent: :destroy

  scope :sorted, ->{ order(position: :asc)}
  validates :name, presence: true

  accepts_nested_attributes_for :foods, allow_destroy: true

end
