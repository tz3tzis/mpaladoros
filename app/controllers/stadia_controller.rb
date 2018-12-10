class StadiaController < ApplicationController

	
	def index
		@stadia = Stadium.all
	end

	def new
		@stadium = Stadium.new
	end


	def edit
		@admin = current_admin
		@stadia = Stadium.where("admins_id: #{@admin.id}")
	end

	def update
		
		@admin = current_admin

		@stadium = Stadium.find(params[:id])
		@stadium.max_players = params[:stadium][:max_players]
		@stadium.price = params[:stadium][:price]

		if (@stadium.price.nil? || @stadium.max_players.nil?)
			flash[:notice] = "Ούπς , κατι πηγε στραβά"
			redirect_to stadium_attributes_path(@admin.id)
		else
			@stadium.save!
			flash[:notice] = "Τα στοιχεία άλλαξαν επιτυχώς"
			redirect_to show_path(@admin.id)
		end
	end

	 def stadium_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:stadium).permit(:id, :stadium_name, :max_players, :price, :admin_id, :game_id)
  end
	
end
