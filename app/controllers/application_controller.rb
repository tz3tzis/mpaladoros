class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #make the current_example method available to views also , not just controllers:
  helper_method :current_admin
  helper_method :current_game

	#define the current_admin
	def current_admin
		 # Look up the current admin based on admin_id in the session cookie:
	    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

	#helper method for current_game based on game id
	def current_game
			@current_game ||= Game.find(params[:id]) if params[:id]
	end

	#redifines the redirect path after fblogin
  def after_sign_in_path_for(resource)
  	games_path
	end

	# authroize method redirects admin to login page if not logged in:
	def authorize
	  redirect_to login_path, alert: 'You must be logged in to access this page.' if current_admin.nil?
	end

	# overriding CanCan::ControllerAdditions

   def current_ability
   	 if current_user
	     @current_ability ||= Ability.new(current_user)
	   elsif current_admin
	     @current_ability ||= Ability.new(current_admin)
	   end
	 end

end
