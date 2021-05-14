Rails.application.routes.draw do
  root 'application#home'
  
  resources :classroom_notes
  resources :classrooms
  resources :notes

  
  resources :students do 
    resources :classroom
  end

  post '/classroom_notes/new', to: "classroom_notes#create"


  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'


  get 'signup', to: 'students#new'
  post 'signup', to: 'students#create'

  
 
end
