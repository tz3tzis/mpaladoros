

OmniAuth.config.logger = Rails.logger 

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '213485926125142', 'c50dff834562bf16fa9506ef8c6369fd' ,
	client_options: {
      site: 'https://graph.facebook.com/v3.1',
      authorize_url: "https://www.facebook.com/v3.1/dialog/oauth"
    }
end