class Stadium < ApplicationRecord
	mount_uploader :image , ImageUploader
	belongs_to :admin
end
