class UsersController < ApplicationController
	

	def show
		@user = User.find(params[:id])
	end


	def edit
		@user = current_user
	end	

	def update

		@user = User.find(params[:id])

		@user.height = params[:user][:height]
		@user.weight = params[:user][:weight]
		@user.position = params[:user][:position]
		@user.birthday = params[:user][:birthdate]
		@user.location = params[:user][:location]
		@user.teamgr   = params[:user][:teamgr]
		@user.teameu   = params[:user][:teameu]

		@user.save!
		redirect_to user_path(@user)
		flash[:notice] = "Τα στοιχεία σου ενημερώθηκαν επιτυχώς"

	end


	private
	 def user_params
	 		params.require(:user).permit(:height, :weight, :position, :birthdate, :location, :teamgr, :teameu)
	 end

end
