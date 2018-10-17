class Team < ApplicationRecord
	
	cattr_accessor :current_user


	has_many :users

end
