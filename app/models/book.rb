class Book < ApplicationRecord
  has_many :reviews
  has_many :reading_lists, dependent: :destroy
end
