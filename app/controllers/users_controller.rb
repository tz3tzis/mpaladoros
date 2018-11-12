class UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
	end


	def edit
		@user = current_user
	end	

	def update

		@user = User.find(params[:id])

		@user.height 	 = params[:user][:height]
		@user.weight 	 = params[:user][:weight]
		@user.position = params[:user][:position]
		@user.birthday = params[:user][:birthdate]
		@user.location = params[:user][:location]
		@user.teamgr   = params[:user][:teamgr]
		@user.teameu   = params[:user][:teameu]

		@user.save!
		redirect_to user_path(@user)
		flash[:notice] = "Τα στοιχεία σου ενημερώθηκαν επιτυχώς"

	end

	def avatar_update

		@user = User.find(params[:id])
		@user.avatar = params['user']['avatar']
		@user.save!
		redirect_to user_path(@user)
		flash[:notice] = "Η φωτογραφία σου ενημερώθηκε επιτυχώς "
	end

	private
	 def user_params
	 		params.require(:user).permit(:height, :weight, :position, :birthdate, :location, :teamgr, :teameu, :avatar)
	 end

end
