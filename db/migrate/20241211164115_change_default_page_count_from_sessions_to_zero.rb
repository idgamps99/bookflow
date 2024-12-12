class ChangeDefaultPageCountFromSessionsToZero < ActiveRecord::Migration[7.1]
  def change
    change_column_default :reading_sessions, :page_count, from: nil, to: 0
  end
end
