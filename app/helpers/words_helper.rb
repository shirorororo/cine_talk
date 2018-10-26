module WordsHelper
  def choose_new_or_edit_word
    if action_name == 'new'
      words_path
    elsif action_name == 'edit'
      word_path
    end
  end
end
