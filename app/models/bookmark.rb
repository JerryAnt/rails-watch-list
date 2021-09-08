class Bookmark < ApplicationRecord
  # has a comment and comment cannot be shorter than 6 characters
  validates :comment, presence: true, length: { minimum: 6 }
  # belongs to a movie
  belongs_to :movie
  # belongs to an list
  belongs_to :list
  # movie cannot be blank
  validates :movie_id, allow_blank: false, presence: true
  # list cannot be blank
  validates :list_id, allow_blank: false, presence: true

  # is unique for a given movie/list couple
  validates :list_id, uniqueness: { scope: :movie_id}
# When you delete a list, you should delete all associated bookmarks
# (but not the movies as they can be referenced in other lists).
# delete list bookmarks deleted  not movie

end
