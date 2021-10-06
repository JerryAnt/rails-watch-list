class Movie < ApplicationRecord
  ## has a title, title is unique, title cannot be blank
  validates :title, uniqueness: false, presence: true
  ## has an overview, overview cannot be blank
  validates :overview, presence: true
  # has many bookmarks
  has_many :bookmarks
  # should not be able to destroy self if has bookmarks children
  has_many :lists, through: :bookmark
end
