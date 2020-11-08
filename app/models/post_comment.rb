class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :replies

	validates :comment, presence: true
end
