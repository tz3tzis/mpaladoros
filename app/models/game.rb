class Game < ApplicationRecord

validates :start_time , presence: true

has_one :stadium
	
end
