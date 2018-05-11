Rails.application.routes.draw do


  resources :games
  resources :users

  get 'signup', to: 'users#new' 
  root "pages#home"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
