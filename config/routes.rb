Rails.application.routes.draw do

  root to: 'home#show'


  resources :posts
  resources :categories
  resources :events_users
  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events do
    resources :posts
  end

#adding routes for user login

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'


    #adding routes for Facebook user login

    match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    match 'auth/failure', to: redirect('/'), via: [:get, :post]

#adding routes for user registration

    get '/signup' => 'users#new'
    post '/users' => 'users#create'

end
