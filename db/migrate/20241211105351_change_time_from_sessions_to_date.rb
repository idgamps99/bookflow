class ChangeTimeFromSessionsToDate < ActiveRecord::Migration[7.1]
  def change
    remove_column :reading_sessions, :session_start
    remove_column :reading_sessions, :session_end
    add_column :reading_sessions, :session_start, :datetime
    add_column :reading_sessions, :session_end, :datetime
  end
end
