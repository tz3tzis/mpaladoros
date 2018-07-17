Rails.application.routes.draw do

	root "pages#home"
  get 'login', to: 'pages#home'

  resources :games

end
