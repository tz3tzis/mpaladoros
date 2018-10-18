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
		@team.users << current_user
		flash[:notice] = "H επιλογή ομάδας έγινε με επιτυχία!"
		flash[:notice] = "Θα ειδοποιηθείς στο messenger για την συνέχεια της διαδικασίας"
	end


 def team_params
 	params.require(:team).permit( :name , :capacity , :game_id, :created_at)
 end


end
