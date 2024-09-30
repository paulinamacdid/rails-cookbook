class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :categories, through: :bookmarks
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: { in: 0..10 }
end
