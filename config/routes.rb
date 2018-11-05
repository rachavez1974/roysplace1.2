Rails.application.routes.draw do
  
  
  get '/admin/login', to: 'sessions#new_admin'
  post '/admin/login', to: 'sessions#create_new_admin'

  get 'admin/addcustomer', to: 'admin#new_user_form'
  post 'admin/create_customer', to: 'admin#create_new_user'
  get  'admin/show_customer',   to: 'admin#show_customer'

  get 'admin/create'

  get 'admin/update'

  get 'admin/edit'

  get 'admin/destroy'

  get 'orders/new'

  get 'orders/show'
  

  root 'static_pages#home'
  get '/about',   to: 'static_pages#about'
  get '/bagged',  to: 'static_pages#bagged'
  get '/contact', to: 'static_pages#contact'
  get '/menus',   to: 'static_pages#menus'
  get '/offers',  to: 'static_pages#offers'

  resources :users do
    resources :addresses
  end

  get  '/signup',   to: 'users#new'
  post '/signup',   to: 'users#create'

  get     '/user/login',  to: 'sessions#new_user'
  post    '/user/login',  to: 'sessions#create_new_user'
  delete  '/logout', to: 'sessions#destroy'

  get '/newreservation', to: 'reservations#new'

  resources :items
  get  '/additem',       to: 'items#new'
  post '/additem',       to: 'items#create'
  get 'admin/dashboard', to: 'admin#dashboard'
  
   
end
