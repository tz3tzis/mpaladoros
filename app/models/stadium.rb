class Stadium < ApplicationRecord
	
	belongs_to :admin
	mount_uploader :photos , PhotosUploader

end
