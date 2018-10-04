class GamesController < ApplicationController

	def index
		@games = Game.all
	end

	def new
		@game = Game.new
	end


	def show
		@game = Game.find(params[:id])
		@stadia = Stadium.all
	end


	def create
		@game = Game.new(game_params)

		if @game.save
			flash[:notice] = "Το παιχνιδι δημιουργήθηκε επιτυχώς"
			redirect_to games_path
		else
			flash.now.alert = "Ούπς , κατι πηγε στραβά"
			render :new

		end

	end

	#def stadia
		#@games = Game.find(params[:id])
		#@stadia = Stadium.all
	#end


	private

		def game_params
			params.require(:game).permit(:start_time, :end_time ,:id , :name)
		end

end
