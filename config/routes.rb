Rails.application.routes.draw do

  root to: 'events#index'

  resources :posts
  resources :categories
  resources :events_users
  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


#adding routes for user login

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

end
