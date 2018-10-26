class ChangeColumnToWords < ActiveRecord::Migration[5.1]
  def change
    change_column_null :words, :word, false
    change_column_null :words, :user_id, false
  end
end
