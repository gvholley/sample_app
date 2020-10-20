class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :photo, content_type: { in: %w[photo/jpeg photo/gif photo/png],
                                    message: "must be a valid image format" },
                    size:         { less_than: 5.megabytes,
                                    message: "should be less than 5MB" }
  def display_image
    photo.variant(resize_to_limit: [500, 500])
  end
end
