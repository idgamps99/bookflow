class AddColumnActiveToSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :reading_sessions, :active, :boolean, default: true
  end
end
