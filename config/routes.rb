Rails.application.routes.draw do
 
  root 'application#home'
  

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  delete 'signout', to: 'sessions#destroy'

  get 'signup', to: 'students#new'
  post 'signup', to: 'students#create'


  resources :scribbles

  resources :classrooms do 
    resources :notes, only: [:new, :create, :index]
  end

  resources :students do 
    resources :notes 
  end


#  get "/search", to: "students#search"
    
 get '/search' => 'students#search'
end

