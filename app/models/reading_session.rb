class ReadingSession < ApplicationRecord
  belongs_to :tracker

  #validates :session_start, presence: true
  validates :tracker, presence: true
end
