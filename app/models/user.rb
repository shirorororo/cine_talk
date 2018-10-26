class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  validates :name, presence: true, length: { maximum: 50 }
  has_many :watch_lists, dependent: :destroy
  has_many :words, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_words, through: :favorites, source: :word
  has_many :reviews
  has_many :comments, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  mount_uploader :profile_image, ImageUploader
  
  def words
    return Word.where(user_id: self.id)
  end
  
  def watch_lists
    return WatchList.where(user_id: self.id)
  end
  
  def reviews
    return Review.where(user_id: self.id)
  end
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  #指定のユーザをフォローする
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

#フォローしているかどうかを確認する
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
