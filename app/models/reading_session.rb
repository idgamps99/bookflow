class ReadingSession < ApplicationRecord
  belongs_to :tracker

  # validates :session_start, presence: true
  validates :tracker, presence: true
  # validates :page_count, numericality: { only_integer: true, greater_than: 0 }
  after_commit :update_tracker

  private

  def update_tracker
    duration = tracker.reading_sessions.sum(:duration)
    tracker.update(total_minutes_spent: duration)
  end
end
