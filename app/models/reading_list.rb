class ReadingList < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :tracker, dependent: :destroy

  validates :book, uniqueness: { scope: :user }
end
