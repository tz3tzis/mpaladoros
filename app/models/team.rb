class Team < ApplicationRecord

	belongs_to :games , :class_name => "Game", :foreign_key => :hometeam_id
	belongs_to :games , :class_name => "Game", :foreign_key => :awayteam_id

end
