class CreateReadingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :reading_sessions do |t|
      t.time :session_start
      t.time :session_end
      t.integer :duration
      t.references :tracker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
