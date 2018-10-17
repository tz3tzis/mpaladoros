class TeamsController < ApplicationController

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
		@team.users << @current_user
		redirect_to games_path
	end


 def team_params
 	params.require(:team).permit( :name , :capacity , :game_id, :created_at)
 end


end
