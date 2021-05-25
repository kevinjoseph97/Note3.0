Rails.application.routes.draw do
  root 'application#home'
  

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  delete 'signout', to: 'sessions#destroy'

  get 'signup', to: 'students#new'
  post 'signup', to: 'students#create'





  resources :classroom_notes
  resources :notes

  resources :students do 
    resources :classrooms, only: [:new, :create, :show]
  end


  resources :classrooms do 
    resources :notes, only: [:index]
  end



end

