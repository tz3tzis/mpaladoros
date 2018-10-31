class MapsController < ApplicationController

	def index
		@game = Game.find(params[:game_id])
	end


	def create
		

	end

end
