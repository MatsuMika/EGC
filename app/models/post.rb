class Post < ApplicationRecord
	belongs_to :user
	has_many :post_comments

	mount_uploader :post_image, PostImageUploader
end
