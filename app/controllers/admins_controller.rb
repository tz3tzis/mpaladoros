class AdminsController < ApplicationController


  def show
  	@games = Game.all
    @admin = current_admin
  end

 def edit
 		@admins = current_admin
		@admin = Admin.find(params[:id])
 end

	def update

		@admin = current_admin 

	
		if params[:admin][:confirm_password] != params[:admin][:new_password ]
			flash[:notice] = "Οι κωδικοί που έβαλες είναι διαφορετικοί!"
			redirect_to edit_admin_path
		else
			@admin.password = params[:admin][:new_password]
			@admin.save!
			redirect_to show_path
			flash[:notice] = "Τα στοιχεία σου άλλαξαν επιτυχώς"
		end
	end

	def stadia
		@admin = Admin.find(params[:id])
		@stadia = current_admin.stadia
	end

private

  def admin_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:admin).permit(:id, :name, :email, :password)
  end
  
	
end
