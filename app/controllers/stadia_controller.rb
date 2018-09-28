class StadiaController < ApplicationController
	
	def index
		@stadia = Stadium.all
	end

	def new
		@stadium = Stadium.new
	end

	
end
