class AddReadToReadingList < ActiveRecord::Migration[7.1]
  def change
    add_column :reading_lists, :read, :boolean, default: false
  end
end
