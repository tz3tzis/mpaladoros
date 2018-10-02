OmniAuth.config.logger = Rails.logger 
Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '213485926125142', 'c50dff834562bf16fa9506ef8c6369fd' ,
	scope:  'email',
  display: 'popup',
  client_options: {
      site: 'https://graph.facebook.com/v3.0',  # this is the example API version
      authorize_url: "https://www.facebook.com/v3.0/dialog/oauth"
    }
end