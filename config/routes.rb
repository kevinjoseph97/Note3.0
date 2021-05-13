Rails.application.routes.draw do

  resources :classroom_notes
  resources :classrooms
  root 'application#home'
  
  resources :notes
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'


  get 'signup', to: 'students#new'
  post 'signup', to: 'students#create'

  resources :students
 
end
