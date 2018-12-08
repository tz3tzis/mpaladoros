class NotifyController < ApplicationController

  def push(user)
    @message = get_message()
    if user.notification_data_id.present?
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

end
