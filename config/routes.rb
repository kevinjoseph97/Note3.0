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
  resources :students 


  resources :classrooms do 
    resources :notes, only: [:index, :new, :create ]
  end





  #post '/classroom_notes/new', to: "classroom_notes#create"







  



end



#want to be able to go to classroom/id/notes .... shoudl show your notes

#want to be able to go to classroom/id/notes/new?????