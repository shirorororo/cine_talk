class ChangeColumnToReviews < ActiveRecord::Migration[5.1]
  def change
    change_column_null :reviews, :title, false
    change_column_null:reviews, :user_id, false
    change_column_null :reviews, :review, false
  end
end