class TeamsController < ApplicationController

	before_action :authenticate_user!

	def index
		@game = Game.find(params[:game_id])
	end

	def new

	end

	def show
		@game = Game.find(params[:game_id])
		@team = Team.find(params[:id])
	end

	def join 

		@team = Team.find(params[:id])

		if team_is_full
			@team.users << current_user
		else
			flash[:notice] = "Η ομάδα είναι πλήρης"
			flash[:notice] = "Παίξτε στην άλλη ομάδα"
			render :new
		end

		flash[:notice] = "H επιλογή ομάδας έγινε με επιτυχία!"
		flash[:notice] = "Θα ειδοποιηθείς στο messenger για την συνέχεια της διαδικασίας"
		render :new

	end


	def team_is_full 
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
