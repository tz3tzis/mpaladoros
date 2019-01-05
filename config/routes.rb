Rails.application.routes.draw do


	root "pages#home"

	get '/users/sign_out' => 'devise/sessions#destroy'

	#get '/users/sign_in' => 'sessions#new'

	#to devise_for mas ftiaxnei kapoia dika tou routes 
	#analoga me ta paidia poy exoume valei sto modelo mas
	devise_for :users , :controllers => 
	{ :omniauth_callbacks => "users/omniauth_callbacks" },
	:except => [:destroy]
	

  # log in page with form:
	get '/login'     => 'sessions#new' 
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#createAdmin'


	# delete action to log out:
	delete '/logout' => 'sessions#destroyAdmin', :as => 'exit_admin'


	#get admin distinct program
 	get '/admins/:id' => 'admins#show' , :as => 'show'

 	#get upadate password form
 	get '/admins/:id/edit' => 'admins#edit' , :as => 'edit_admin'

 	#post changes of the password
	post '/admins/:id' => 'admins#update' , :as => 'update'

	get '/admins/:id/stadia' => 'stadia#index' , :as => 'stadia'

	delete '/game/:id' => 'games#delete' , :as => "delete"

	get '/games/:id/teams/:id' => 'teams#join' , :as => 'join'

	get 'admins/:id/stadium_attributes' => 'admins#stadium_attributes', :as => 'stadium_attributes'


  post '/stadium_attributes/:id'  => 'stadia#update', :as => "stadium_update"
	#=========================notifications========================
	post "/push" => "push_notifications#create"
	#==============================================================

	post '/users/:id' => 'users#update', :as => 'edit_profile'

	#route for the messenger bot
	mount Facebook::Messenger::Server, at: 'bot'

	resources :users , only: [:show, :update, :edit]

	resources :admins , only: [:index, :show, :edit, :update]

	resources :stadia , only: [:show, :update, :edit]

	resources :users do
		member do
			put :avatar_update 
		end
	end
	
	resources :games do
		resources :maps
		resources :teams
	end


end
