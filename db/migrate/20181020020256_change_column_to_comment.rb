class ChangeColumnToComment < ActiveRecord::Migration[5.1]
  def change
    change_column_null :comments, :word_id, false
    change_column_null:comments, :user_id, false
    change_column_null :comments, :content, false
  end
end
