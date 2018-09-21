Rails.application.routes.draw do

	root "pages#home"

  # log in page with form:
	get '/login'     => 'sessions#new'
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	
	# delete action to log out:
	delete '/logout' => 'sessions#destroy'  


	get 'static_pages/home'

  get 'static_pages/help'

  get '/update' => 'admins#update'
 
  resources :admins
  resources :games

end
