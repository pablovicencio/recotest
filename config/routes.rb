Rails.application.routes.draw do
  devise_for :users
  get 'cities/list'
  resources :class_services
  resources :alerts
  get '/home', to: "home#index"

  get "alerts/user/:user_id", to: "articles#from_user"

  root to: "home#index"
  #get :search_bus_travels, controller: :bus_travels
  get '/bus_travels', to: "bus_travels#search_bus_travels"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
