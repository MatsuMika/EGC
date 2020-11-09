class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 	has_many :posts, dependent: :destroy
 	has_many :favorites, dependent: :destroy
 	has_many :post_comments, dependent: :destroy
	has_many :replies, dependent: :destroy

  	mount_uploader :avatar, AvatarUploader

	validates :name, length: { in: 2..20 }
 	validates :nick_name, length: { in: 1..15 }, presence: true
 	validates :introduction, length: { maximum: 600 }

end