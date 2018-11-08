Rails.application.routes.draw do

	root "pages#home"

	get '/users/sign_out' => 'devise/sessions#destroy'

	#to devise_for mas ftiaxnei kapoia dika tou routes 
	#analoga me ta paidia poy exoume valei sto modelo mas
	devise_for :users , :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" },:except => [:destroy]
	

  # log in page with form:
	get '/login'     => 'sessions#new' 
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#createAdmin'


	# delete action to log out:
	delete '/logout' => 'sessions#destroyAdmin' 


	#get admin distinct program
 	get '/admins/:id' => 'admins#show' , :as => 'show'

 	#get upadate password form
 	get '/admins/:id/edit' => 'admins#edit' , :as => 'edit_admin'

 	#post changes of the password
	post '/admins/:id' => 'admins#update' , :as => 'update'

	get '/admins/:id/stadia' => 'stadia#index' , :as => 'stadia'

	delete '/game/:id' => 'games#delete' , :as => "delete"

	get '/games/:id/teams/:id' => 'teams#join' , :as => 'join'


	resources :users , only: [:show, :update, :edit]
	
	resources :games do
		resources :maps
		resources :teams
	end

	resources :admins , only: [:index, :show, :edit, :update]

  
  
end
