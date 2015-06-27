OmniAuth.config.logger = Rails.logger

app_id = "395477050649976"
app_secret = "e285dcc0571547b59aff3e7bd06b6689"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,  app_id, app_secret,
           :scope => 'email,user_birthday,read_stream',
            :display => 'popup'
end