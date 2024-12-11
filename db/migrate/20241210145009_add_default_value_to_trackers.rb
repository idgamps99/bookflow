class AddDefaultValueToTrackers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :trackers, :current_page, from: nil, to: 0
    change_column_default :trackers, :total_minutes_spent, from: nil, to: 0
    change_column_default :trackers, :reading_status, from: nil, to: "Started tracking"
  end
end
