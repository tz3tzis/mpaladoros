Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  scope: 'name,email,user_birthday,read_stream', 
  display: 'popup',
  image_size: 'normal'
end