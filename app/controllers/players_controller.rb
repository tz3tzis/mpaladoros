class PlayersController < ApplicationController
	def new
		@player = Player.new
	end

	def create
	 player = Player.new(name: params[:player][:name])
   player.email = params[:player][:email]
   player.password = params[:player][:password]
   player.save
   session[:player_id] = player.id
   redirect_to games_path
	end
end
