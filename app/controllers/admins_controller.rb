class AdminsController < ApplicationController


	

  def index
    @games = Game.all
  end

   def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @admin.email.downcase!
    
    if @admin.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

private

  def admin_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:admin).permit(:name, :email, :password, :telephone, :IBAN)
  end
  
# ----- end of added lines -----
	
end
