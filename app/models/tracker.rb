class Tracker < ApplicationRecord
  belongs_to :reading_list
  has_many :reading_sessions, dependent: :destroy
end
