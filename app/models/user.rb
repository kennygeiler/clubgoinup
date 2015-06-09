class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.image    = auth.info.image
      user.name     = auth.info.name
      user.save
    end
  end

  def graph_api()
    @graph = Koala::Facebook::API.new('CAACEdEose0cBAL3K9ksW8MNYgINViSZAVOSuXw4t7skPxhbAKPG18DZAYC5uKz3QmCNA7PRSvHiZCIKfB0je0j5juGiDck0wVlkSrlEQUZAQPZCBVEwfZCGtRvcOmR45Kf77XjA98ZATocINuylrwrzTxjmXaqqpkiNa50wRVBNDMtlKcoCMpPoFzP388J5ziuFICwCund9dRKVLX0U69PI')
    friends = @graph.get_connections("me", "friends")
    print friends
  end
end
