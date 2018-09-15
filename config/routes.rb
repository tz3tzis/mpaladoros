Rails.application.routes.draw do

  get 'static_pages/home'

  get 'static_pages/help'

	root "pages#home"
  get 'login', to: 'pages#home'

  resources :games
  resources :players
  resources :admins

end
