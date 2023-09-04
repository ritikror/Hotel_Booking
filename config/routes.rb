Rails.application.routes.draw do
  resources :locations
  resources :customers
  resources :bookings
  resource :users
  post 'user/login', to: 'users#login'
  # patch 'users', to: 'users#update'
  # put 'users', to: 'users#update'
  # delete 'users', to: 'users#destroy'

   

  resources :hotels
  get '/search_by_location', to: 'hotels#search_hotel_by_location'
  get '/search_hotel_by_name', to: 'hotels#search_hotel_by_name'
  

  post '/room/create', to: 'rooms#create'
  get '/room/list', to: 'rooms#room_list_by_hotel_id'

  get '/open_hotel', to: 'customers#open_hotel'
     
end
