class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :replies, ->{order('created_at DESC')}

	validates :comment, presence: true
end
