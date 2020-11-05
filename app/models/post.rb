class Post < ApplicationRecord
	belongs_to :user
	has_many :post_comments
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

	mount_uploader :post_image, PostImageUploader


	validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true
  validates :post_image, presence: true


end
