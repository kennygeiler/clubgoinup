class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.image    = auth.info.image
      user.user_friends = auth.info.name
      user.name     = auth.info.name
      user.save
    end
  end
end
