class TeamsController < ApplicationController
	def index
		@team = Team.all
	end
end
