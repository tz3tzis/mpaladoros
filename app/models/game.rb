class Game < ApplicationRecord

	belongs_to :stadium

	has_one :hometeam , :class_name => 'Team' 
	has_one :awayteam , :class_name => 'Team' 

end 
