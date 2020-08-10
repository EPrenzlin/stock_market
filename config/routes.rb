Rails.application.routes.draw do
  resources :shares
  resources :companies

  get '/' => 'sessions#welcome'
 
  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create' 
  get '/signup' => 'company#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
