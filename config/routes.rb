Rails.application.routes.draw do


  resources :examples
  resources :games
  resources :users

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  get 'signup', to: 'users#new' 
  root "pages#home"

  get 'fblogin', to: "pages#fblogin"

  # in config/routes.rb
  # you don't visit this URL yourself. It's for Facebook to redirect to
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
