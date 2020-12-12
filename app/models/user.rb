class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: %i(google)
#auth使用
  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      if user.nick_name.blank?
        user.nick_name = "名無し"
      end
      user.password = Devise.friendly_token[0,20]
    end
  end

 	has_many :posts, dependent: :destroy
 	has_many :favorites, dependent: :destroy
 	has_many :post_comments, dependent: :destroy
	has_many :replies, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

	validates :name, length: { in: 2..20 }
 	validates :nick_name, length: { in: 1..15 }, presence: true
 	validates :introduction, length: { maximum: 1000 }

 	def self.guest
  	find_or_create_by!(email: ENV['GUEST_EMAIL']) do |user|
	    user.password = SecureRandom.urlsafe_base64
	    user.name = "ゲストユーザー"
	    user.nick_name = "ゲスト"
  	end
  end

end