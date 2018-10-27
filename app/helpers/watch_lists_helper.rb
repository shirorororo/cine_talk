module WatchListsHelper
  def choose_new_or_edit_watchlist
    if action_name == 'new'
      watch_lists_path
    elsif action_name == 'edit'
      watch_list_path
    end
  end
end
