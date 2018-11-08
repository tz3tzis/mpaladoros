class UsersController < ApplicationController
	attr_accessor :name, :position, :birthday, :teamgr, :teameu

	def show
		@user = User.find(params[:id])
	end


	def edit
		@user = current_user
	end	

	def update

		@user = User.find(params[:id])

		@user.height = params[:height]
		@user.weight = params[:weight]
		@user.position = params[:position]
		@user.birthday = params[:birthdate]
		@user.teamgr   = params[:teamgr]
		@user.teameu   = params[:teameu]

		@user.save!
		redirect_to user_path(@user)
		flash[:notice] = "Τα στοιχεία σου ενημερώθηκαν επιτυχώς"

	end

end
