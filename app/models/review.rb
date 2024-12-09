class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rating, presence: true, numericality: { in: 0..5 }
end
