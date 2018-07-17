class GamesController < ApplicationController
	
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
		@game = Game.find(params[:id])
	end

	private 
		def game_params
			params.require(:game).permit(:starts_at, :stadium)
		end
end