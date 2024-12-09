class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year_published
      t.text :summary
      t.string :genre
      t.string :author
      t.integer :page_count
      t.integer :overall_rating

      t.timestamps
    end
  end
end
