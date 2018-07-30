class GamesController < ApplicationController

	before_action :set_games, only:[:show, :destroy]
	
	def index
		@games = Game.all 
	end

	def new
		@game = Game.new
	end

	def create
		@game= Game.new(game_params)
		if @game.save
			flash[:notice] = "Το παιχνίδι δημιουργήθηκε επιτυχώς"
			redirect_to game_path(@game)
		else
			render 'new'
		end
	end

	def show
		
	end

	def destroy
		
		@game.destroy
		flash[:notice] = "Το παιχνίδι διαγράφηκε επιτυχώς"
		redirect_to games_path

	end

	private 
		def set_games
			@game = Game.find(params[:id])
		end
		def game_params
			params.require(:game).permit(:starts_at, :stadium)
		end
end