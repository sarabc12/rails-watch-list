class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks

# --------------------------PGSearch-------------------------------------

  include PgSearch::Model
  pg_search_scope :search_by_title,
  against: [ :title ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

# ------------------------------------------------------------------------------
  # validates :title, presence: true, uniqueness: true
  # validates :overview, presence: true
end
