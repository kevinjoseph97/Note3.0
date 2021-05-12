Rails.application.routes.draw do
  
  resources :sessions, only: [:create]


  resources :students
 
end
