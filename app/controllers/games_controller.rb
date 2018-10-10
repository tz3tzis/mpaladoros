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
		#@game = Game.find(params[:id])
		#@stadia = Stadium.all
	end


	def create

		@game = Game.new(game_params)

		@stadium = Stadium.find_by(stadium_name: "#{@game.name}")
		@stadium.game_id = @game.id

		#get time from clock and concatenate it with date to start_time
		date = params['game']['start_time']
		time = params['game']['time']
		@game.start_time = Time.parse("#{date} #{time}") + 3.hours

		@game.admin_id = @stadium.admin_id 
		@game.end_time = @game.start_time + 90.minutes
			
		#save game
		if @game.save 
			@stadium.save!
			flash[:notice] = "Το παιχνιδι δημιουργήθηκε επιτυχώς"
			redirect_to games_path
		else
			flash[:notice] = "Ούπς , κατι πηγε στραβά"
			render :new
		end

	end

	def delete()
		Game.find(params[:id]).destroy
		redirect_to games_path
	end


	private

		def game_params
			params.require(:game).permit(:id, :start_time, :end_time, :name ,:admin_id)
		end

end
