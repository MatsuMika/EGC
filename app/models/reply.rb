class Reply < ApplicationRecord
	belongs_to :post_comment
	belongs_to :user

	validates :comment, presence: true
end
