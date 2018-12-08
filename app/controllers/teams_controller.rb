class TeamsController < ApplicationController

	before_action :authenticate_user!
	

	def index
		@game = Game.find(params[:game_id])
	end

	def new

	end

	def show
		@game = Game.find(params[:game_id])
		@team = Team.find(params[:id])
	end

	def join 

		@team = Team.find(params[:id])
		#@game = Game.find(params[:game_id])

		if team_not_full
			@team.users << current_user
			flash[:notice] = "H επιλογή ομάδας έγινε με επιτυχία! Θα ειδοποιηθείς στο messenger για την συνέχεια της διαδικασίας"
			redirect_back fallback_location: games_url
		else
			flash[:notice] = "Η ομάδα είναι πλήρης.Παίξτε στην άλλη ομάδα"
			redirect_back fallback_location: games_url
		end
	end


	def push

    @user = User.find(params[:id])
    @message = "Το παιχνίδι θα γινει !"
    if @user.notification_data_id.present?
      @notification_data = NotificationData.find(user.notification_data_id)
      Webpush.payload_send(endpoint: @notification_data.endpoint,
          message: @message,
          p256dh: @notification_data.p256dh_key,
          auth: @notification_data.auth_key,
          tl: 24 * 60 * 60,
          vapid: {
              subject: 'mailto:admin@commercialview.com.au',
              public_key: ENV['VAPID_PUBLIC_KEY'],
              private_key: ENV['VAPID_PRIVATE_KEY']
          }
      )
    end
    lash[:notice] = "Θα ειδοποιηθείς στον browser για την συνέχεια της διαδικασίας"
    redirect_to games_url
  end


	def team_not_full 
		@team = Team.find(params[:id])
		if @team.users.count >= @team.capacity
			return false
		else
			return true
		end
	end


	


 def team_params
 	params.
 		require(:team).
 			permit( :name , :capacity , :game_id, :created_at)
 end


end
