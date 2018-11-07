class UsersController < ApplicationController
	attr_accessor :name, :position, :birthday, :teamgr, :teameu

	def show
		@user = User.find(params[:id])
	end

	def update

		@user = User.find(params[:id])

		@user.position = params[:position]
		@user.birthday = params[:birthdate]
		@user.teamgr   = params[:teamgr]
		@user.teamgeu   = params[:teameu]

		@user.save!
		flash[:notice] = "Τα στοιχεία σου ενημερώθηκαν επιτυχώς"

	end

end
