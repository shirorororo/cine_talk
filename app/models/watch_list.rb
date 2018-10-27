class WatchList < ApplicationRecord
  validates :watch_list, presence: true
  belongs_to :user
  validates :user_id, presence: true
  
  def watch_lists
    return WatchList.where(user_id: self.id)
  end
end
