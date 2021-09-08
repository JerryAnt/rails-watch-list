class List < ApplicationRecord

  # has many bookmarks and should destroy child saved movies when destroying self
  has_many :bookmarks, dependent: :destroy

  # has a name, name is unique, name cannot be blank
  validates :name, uniqueness: true, presence: true

  # has many movies through bookmark
  has_many :movies, through: :bookmarks
end

