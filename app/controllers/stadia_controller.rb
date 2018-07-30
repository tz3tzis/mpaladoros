class StadiaController < ApplicationController
	def index
		@stadia = Stadium.all
	end
end
