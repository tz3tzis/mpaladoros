class GamesController < ApplicationController

		def index 
			@games=Game.all
		end

		def show

		end

		def new
			@game = Game.new
		end

		def create 

			@game = Game.new 

			if @game.save
				flash[:notice] = "To παιχνίδι δημιουργήθηκε επιτυχώς"
				redirect_to_games_path
			else
				flash.now.alert = "Το παιχνίδι δεν δημιουργήθηκε επιτυχώς"
				render :new
			end
		end

		def start_time
			self.starts_at
		end

end
