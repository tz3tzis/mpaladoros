class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	#make the current admin method available to views also , not just controllers:
	helper_method :current_admin
	  
	#define the current_admin
	def current_admin
		 # Look up the current admin based on admin_id in the session cookie:
	    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

	def current_player
		 # Look up the current player based on player_id in the session cookie:
	    @current_player ||= Player.find(session[:player_id]) if session[:player_id]
	end


	# authroize method redirects admin to login page if not logged in:
	def authorize
	  redirect_to login_path, alert: 'You must be logged in to access this page.' if current_admin.nil?
	end



end
