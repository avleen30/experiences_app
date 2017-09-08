Rails.application.routes.draw do

  root to: 'home#show'


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


    #adding routes for Facebook user login

    get 'auth/facebook/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')

#adding routes for user registration

    get '/signup' => 'users#new'
    post '/users' => 'users#create'

end
