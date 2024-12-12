class Tracker < ApplicationRecord
  belongs_to :reading_list
  has_many :reading_sessions, dependent: :destroy
  # belongs_to :user, through: :reading_list

  validates :reading_list, uniqueness: true
end
