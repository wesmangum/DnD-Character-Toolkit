class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter]

  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.provider = auth.provider
      user.email = auth.provider == "twitter" ? "#{auth.info.nickname}@twitter.com" : auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
    user
  end
end
