class Game < ApplicationRecord
	validates :starts_at, presence: true
	validates :stadium, presence: true
	
end
