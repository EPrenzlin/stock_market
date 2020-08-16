Rails.application.routes.draw do
  resources :companies, only: [:show,:new,:index] do 
    resources :shares, only:[:new, :show, :edit, :index, :destroy]
  end 
  
  resources :shares 
  resources :companies
  
  resources :stock_exchange, only:[:show, :index] 

  
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create' 
  get '/signup' => 'company#new'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/search' => 'search#new'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth' 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
