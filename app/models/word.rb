class Word < ApplicationRecord
    validates :word, presence: true
    belongs_to :user
    validates :user_id, presence: true
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    has_many :comments, dependent: :destroy
end
