
require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token:ENV["ACCESS_TOKEN"])  

Bot.on :message do |message|
  message.reply(text: 'Καλωσήρθες παιχταρά μου!')
  message.reply(
	  attachment: {
	    type: 'template',
	    payload: {
	      template_type: 'button',
	      text: 'Σου αρέσει η εφαρμογη ?',
	      buttons: [
	        { type: 'postback', title: 'Ναι', payload: 'yes' },
	        { type: 'postback', title: 'Οχι', payload: 'no' }
	      ]
	    }
	  }
	)
end

Bot.on :postback do |postback|
	postback.sender
	postback.recipient
	postback.sent_at
	postback.payload

	if postback.payload == "yes"
		postback.reply(text: "Τότε μπες εδω https://mpaladoros-app.herokuapp.com και ξεκίνα το παιχνίδι! ")
	elsif postback.payload == 'no'
		postback.reply(text: "ΑΝΤΕ ΓΕΙΑ!") 
		postback.reply(
			attachment: {
				type: 'image',
				payload: {
					url: 'https://www.reader.gr/sites/default/files/styles/reader_l/public/tsoykalas.jpg?itok=WTYkINB5'
				}
			}
		)
	end

end