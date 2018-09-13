class Admin < ApplicationRecord
	has_many :stadia
	has_secure_password
	validates :username, presence: true, 
						uniqueness: true, 
						length: { minimum: 3, maximum:25 }

	
end
