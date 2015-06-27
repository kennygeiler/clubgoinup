OmniAuth.config.logger = Rails.logger

app_id = "1219088654784253"
app_secret = "d3b709645cb76d5038a384f5f2c62237"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,  app_id, app_secret,
           :scope => 'email',
            :display => 'popup'
end