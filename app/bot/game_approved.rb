include Facebook::Messenger 

Bot.on :message do |message|
	message.reply(text: 'Hello, playa!')
end