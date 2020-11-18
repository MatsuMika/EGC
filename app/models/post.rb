class Post < ApplicationRecord
	belongs_to :user
	has_many :post_comments
	has_many :favorites, dependent: :destroy

	mount_uploader :post_image, PostImageUploader

    validates :title, presence: true, length: { maximum: 50 }
  	validates :subtitle, presence: true, length: { in: 5..80 }
  	validates :post_image, presence: true
  	validates :body, presence: true, length: { minimum: 20 }
    validates :portfolio_url, length: { maximum: 200 }
  	validates :source_code_url, length: { maximum: 200 }
  	validates :message, length: { maximum: 200 }
  	validates :development_environment_text, length: { maximum: 800 }

  	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end
end
