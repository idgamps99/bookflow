class Book < ApplicationRecord
  has_many :reviews
  has_many :reading_lists

  include PgSearch::Model
  pg_search_scope :search_by_title_and_summary,
    against: [ :title, :summary ],
    using: {
      tsearch: { prefix: true }
    }

    pg_search_scope :search_by_genre,
    against: [ :genre ],
    using: {
      tsearch: { prefix: true }
    }
end
