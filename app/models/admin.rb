class Admin < ApplicationRecord

	enum role: [ :admin ]

	has_many :stadia

	before_save { self.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email , presence: true , length: {maximum: 255 },
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: true}

 


	has_secure_password

end
