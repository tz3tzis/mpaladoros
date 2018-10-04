class Stadium < ApplicationRecord
	
	belongs_to :admin
	belongs_to :game
	mount_uploader :photos , PhotosUploader

end
