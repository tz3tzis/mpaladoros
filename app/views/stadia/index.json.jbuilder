json.array! current_admin.stadia.each do |stad|
	json.lat stad.latitude
	json.lng stad.longitude
	json.title stad.stadium_name
end