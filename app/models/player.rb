class Player < ApplicationRecord
	
	def self.find_or_create_by_omniauth(auth_hash)
		 self.where(email: auth_hash[‘info’][‘email’]).first_or_create do |u|
		 u.name = auth_hash[‘info’][‘name’]
		 u.password = SecureRandom.hex
		 end
	end
	
end
