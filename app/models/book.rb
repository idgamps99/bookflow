class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :reading_lists, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true }
    }

    pg_search_scope :search_by_genre,
    against: [ :genre ],
    using: {
      tsearch: { prefix: true }
    }
end
