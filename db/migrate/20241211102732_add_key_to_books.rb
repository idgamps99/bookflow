class AddKeyToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :key, :string
  end
end
