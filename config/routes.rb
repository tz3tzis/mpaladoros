Rails.application.routes.draw do

	root "pages#home"

  # log in page with form:
	get '/login'     => 'sessions#new' 
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#createAdmin'


	# delete action to log out:
	delete '/logout' => 'sessions#destroyAdmin' 

	
	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	#match 'auth/facebook/callback' , to: 'sessions#create', as: 'fblogin', via: [:get, :post]
	#match 'auth/failure', to: redirect('/'), via: [:get, :post]
	#match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]



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
