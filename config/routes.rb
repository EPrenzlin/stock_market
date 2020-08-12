Rails.application.routes.draw do
  resources :shares
  resources :companies

  get '/' => 'sessions#welcome'
 
  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create' 

  get '/signup' => 'company#new'

  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth' 
  #need to change the provider to google 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
