class MapsController < ApplicationController

	def index
		@game = Game.find(params[:game_id])
		@sta = Stadium.find(@game.stadium_id)
		@user = current_user
	end


	def create
		
	end

end
