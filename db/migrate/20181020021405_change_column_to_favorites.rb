class ChangeColumnToFavorites < ActiveRecord::Migration[5.1]
  def change
    change_column_null :favorites, :word_id, false
    change_column_null :favorites, :user_id, false
  end
end
