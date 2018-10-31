class MapsController < ApplicationController

	def index
		@game = Game.find(params[:game_id])
		stadium = Stadium.find(@game.stadium_id)
	end


	def create
		
	end

end
