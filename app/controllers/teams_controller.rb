class TeamsController < ApplicationController

	before_action :authenticate_user!
	

	def index
		@game = Game.find(params[:game_id])
		@decodedVapidPublicKey = Base64.urlsafe_decode64(ENV['VAPID_PUBLIC_KEY']).bytes

	end

	def new

	end

	def show
		@game = Game.find(params[:game_id])
		@team = Team.find(params[:id])
	end

	def join 

		@team = Team.find(params[:id])
		#@game = Game.find(params[:game_id])

		if team_not_full
			@team.users << current_user
			flash[:notice] = "H επιλογή ομάδας έγινε με επιτυχία! Θα ειδοποιηθείς στο messenger για την συνέχεια της διαδικασίας"
			redirect_back fallback_location: games_url
		else
			flash[:notice] = "Η ομάδα είναι πλήρης.Παίξτε στην άλλη ομάδα"
			redirect_back fallback_location: games_url
		end
	end



	def team_not_full 
		@team = Team.find(params[:id])
		if @team.users.count >= @team.capacity
			return false
		else
			return true
		end
	end



 def team_params
 	params.
 		require(:team).
 			permit( :name , :capacity , :game_id, :created_at)
 end


end
