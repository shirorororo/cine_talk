class Comment < ApplicationRecord
  belongs_to :word
  belongs_to :user
  validates :content, presence: true
end
