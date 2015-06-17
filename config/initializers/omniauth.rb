OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_ID_CLUB'], ENV['FACEBOOK_SECRET_CLUB'],
  :scope => 'email,user_friends,public_profile'
end