class ChangeColumnToWatchLists < ActiveRecord::Migration[5.1]
  def change
    change_column_null :watch_lists, :watch_list, false
    change_column_null :watch_lists, :user_id, false
  end
end