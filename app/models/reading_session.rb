class ReadingSession < ApplicationRecord
  belongs_to :tracker

  # validates :session_start, presence: true
  validates :tracker, presence: true
  # validates :page_count, numericality: { only_integer: true, greater_than: 0 }
end
