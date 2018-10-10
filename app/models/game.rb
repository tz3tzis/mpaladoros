class Game < ApplicationRecord
validates :start_time , :length => { minimum: 0} , :allow_blank => false

has_one :stadium

end 
