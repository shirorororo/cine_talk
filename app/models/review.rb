class Review < ApplicationRecord
  validates :title, length: { in: 1..30 }
  validates :review, length: { in: 1..5000 }
  belongs_to :user, dependent: :destroy
  mount_uploader :review_image, ImageUploader
end
