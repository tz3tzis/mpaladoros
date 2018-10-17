class Game < ApplicationRecord

	belongs_to :stadium 

	has_many :users , :through => :teams

	 def hometeam
    Team.find(hometeam_id)
  end
 
  def awayteam
    Team.find(awayteam_id)
  end

end 
