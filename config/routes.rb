Rails.application.routes.draw do
  get 'users/new'

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
   
end
