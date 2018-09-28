Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'FACEBOOK_KEY', 'FACEBOOK_SECRET',
  scope: 'email,user_birthday,read_stream', 
  display: 'popup'
end