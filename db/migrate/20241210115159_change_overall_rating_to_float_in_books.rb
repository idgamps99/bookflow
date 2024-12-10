class ChangeOverallRatingToFloatInBooks < ActiveRecord::Migration[7.1]
  def change
    change_column :books, :overall_rating, :float
  end
end
