class Stadium < ApplicationRecord
	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }  # auto-fetch address

	belongs_to :admin
	has_many :games
end
