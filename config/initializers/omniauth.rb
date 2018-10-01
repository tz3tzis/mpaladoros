require 'omniauth-facebook'

OmniAuth.config.logger = Rails.logger 

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '213485926125142', 'c50dff834562bf16fa9506ef8c6369fd'
end