class AddPageCountToReadingSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :reading_sessions, :page_count, :integer
  end
end
