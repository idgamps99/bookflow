class CreateTrackers < ActiveRecord::Migration[7.1]
  def change
    create_table :trackers do |t|
      t.integer :current_page
      t.integer :total_minutes_spent
      t.string :reading_status
      t.references :reading_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
