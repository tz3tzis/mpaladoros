Rails.application.routes.draw do

	root "pages#home"

  # log in page with form:
	get '/login'     => 'sessions#new'
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	
	# delete action to log out:
	delete '/logout' => 'sessions#destroy' 

	#get '/admins/:id/edit' => 'admins#edit'

 	get '/admins/:id' => 'admins#show' , :as => 'show'
 	get '/admins/:id/edit' => 'admins#edit' , :as => 'edit_admin'

	post '/admins/:id' => 'admins#update' , :as => 'update'

	resources :games 

  resources :admins , :except => [:new,:index]
end
