class CreateReadingLists < ActiveRecord::Migration[7.1]
  def change
    create_table :reading_lists do |t|
      t.boolean :active, default: true
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
