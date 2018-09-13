class Game < ApplicationRecord
	validates :starts_at, presence: true

	has_one :stadium	

	has_one :team_a , class_name: 'Team'
	has_one :team_b , class_name: 'Team'
	
end
