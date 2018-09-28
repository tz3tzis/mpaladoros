Rails.application.routes.draw do

  devise_for :users ,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	root "pages#home"

  # log in page with form:
	get '/login'     => 'sessions#new' 
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'


	# delete action to log out:
	delete '/logout' => 'sessions#destroy' 

	#for facebook login
	get '/auth/facebook/callback', to: 'sessions#createPlayer' 



	#get admin distinct program
 	get '/admins/:id' => 'admins#show' , :as => 'show'

 	#get upadate password form
 	get '/admins/:id/edit' => 'admins#edit' , :as => 'edit_admin'

 	#post changes of the password
	post '/admins/:id' => 'admins#update' , :as => 'update'

	get '/admins/:id/stadia' => 'stadia#index' , :as => 'stadia'

	get '/admins/:id/stadia/new' => 'stadia#new' 


	resources :games 

  resources :admins , :except => [:new,:index]
  
end
