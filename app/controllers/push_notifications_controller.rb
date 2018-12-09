class PushNotificationsController < ApplicationController
	
	def create
		post '/push' do
		  Webpush.payload_send(
		    message: params[:message],
		    endpoint: params[:subscription][:endpoint],
		    p256dh: params[:subscription][:keys][:p256dh],
		    auth: params[:subscription][:keys][:auth],
		    ttl: 24 * 60 * 60,
		    vapid: {
		      subject: 'mailto:sender@example.com',
		      public_key: ENV['VAPID_PUBLIC_KEY'],
		      private_key: ENV['VAPID_PRIVATE_KEY']
		    }
		  )
		end
	end
end
