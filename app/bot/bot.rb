
require 'facebook/messenger'
include Facebook::Messenger

#Facebook::Messenger::Subscriptions.subscribe(access_token:ENV["ACCESS_TOKEN"])  

Bot.on :message do |message|
  message.reply(text: 'Καλωσήρθες στο mpaladoros.gr! Αυτή την στιγμή μιλά με το chatbot της εφαρμογής.
  	Οι επιλογές σου είναι οι εξής (1) Μπές στον ιστότοπο της εφαρμογής (2) Δές τα τρέχοντα παιχνίδια που είναι ενεργά
  	(3) Προσκάλεσαι έναν φίλο σου')
  message.reply(text: ' Για να συνεχίσεις πάτα τον αριθμό που επιθυμείς απο το παρακάτω μενού.')
  message.reply(
	  attachment: {
	    type: 'template',
	    payload: {
	      template_type: 'button',
	      text: 'Δίάλεξε υπηρεσία ',
	      buttons: [
	        { type: 'postback', title: '(1)', payload: '1' },
	        { type: 'postback', title: '(2)', payload: '2' },
	        { type: 'postback', title: '(3)', payload: '3' }
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

	if postback.payload == "1"
		postback.reply(text: "Μπες εδω https://mpaladoros-app.herokuapp.com και ξεκίνα το παιχνίδι! ")
	elsif postback.payload == '2'
		postback.reply(text: "Μπες εδω https://mpaladoros-app.herokuapp.com/games και ξεκίνα το παιχνίδι! ")
	elsif postback.payload =='3'
		postback.reply(text:'το τρία για για')
	else
		postback.reply(text:'Μη εγκυρή επιλογή. Ξαναπροσπάθησε')
	end

end