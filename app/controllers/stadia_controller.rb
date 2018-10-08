class StadiaController < ApplicationController
	
	def index
		@stadia = Stadium.all
	end

	def new
		@stadium = Stadium.new
	end

	 def admin_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:stadium).permit(:id, :stadium_name, :max_players, :admin_id, :game_id)
	
end
