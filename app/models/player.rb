class Player < ApplicationRecord
	belongs_to :team

	validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum:25 }

end
