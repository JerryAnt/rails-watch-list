class Movie < ApplicationRecord
  belongs_to :list, through: :bookmark
  has_many :bookmarks
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
  validates :list, uniqueness: true
  validates :comment, length: { minimum: 2 }
end
