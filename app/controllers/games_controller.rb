class GamesController < ApplicationController

	def index
		@games = Game.all
		@admin=Admin.all.find_by(@game.admin_id) if !current_game.nil?

	end

	def new
		@game = Game.new
		@stadia = Stadium.all
		
	end


	def show
		@game = Game.find(params[:id])
		#@stadia = Stadium.all
	end


	def create


		@game = Game.new(game_params)

		@stadium = Stadium.find_by(stadium_name: "#{@game.name}")
		@stadium.game_id = @game.id
		@game.admin_id = @stadium.admin_id 
		#@game.end_time = @game.start_time + 90.minutes
		
		
		if @game.save
			flash[:notice] = "Το παιχνιδι δημιουργήθηκε επιτυχώς"
			redirect_to games_path
		else
			flash.now.alert = "Ούπς , κατι πηγε στραβά"
			render :new

		end

	end

	#def stadium

		
	#end


	private

		def game_params
			params.require(:game).permit(:start_time, :end_time, :name ,:admin_id)
		end

end
