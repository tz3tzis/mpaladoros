
require 'facebook/messenger'
include Facebook::Messenger

#Facebook::Messenger::Subscriptions.subscribe(access_token:ENV["ACCESS_TOKEN"])  

Bot.on :message do |message|
  message.reply(text: 'Καλησπέρα παιχταρά μου!')
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
		postback.reply(text: "Τότε μπες εδω(www.mpaladoros-app.herokuapp.com) και ξεκίνα το παιχνίδι!")
	elsif postback.payload == 'no'
		postback.reply(text: "ΑΝΤΕ ΓΕΙΑ!") 
		postback.reply(
			attachment: {
				type: 'image',
				payload: {
					'https://tenor.com/view/tsoukalas-gif-6718908'
				}
			}
		)
	end

end