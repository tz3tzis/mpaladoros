class Game < ApplicationRecord
	validates :starts_at, presence: true
	
	has_one :stadium


end
