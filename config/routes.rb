Rails.application.routes.draw do

  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'

  resources :users, only: [:new, :create]
  
  resources :orders, only: [:index, :show]

  resources :dashboard, only: [:index]

  get '/cart', :to => 'carts#index', :as => 'cart'

  resources :items, only: [:index, :show]

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
resources :carts, only: [:index, :create, :destroy]
get '/:category', to: 'categories#show', param: :slug, as: "category"
=======
>>>>>>> orders
=======
>>>>>>> e739e133aaaf2b2d5c047e07ab3d8e759ec23e50
  resources :carts, only: [:index, :create]
=======
  resources :carts, only: [:index, :create, :destroy]
>>>>>>> orders-2
=======
  resources :carts, only: [:index, :create, :destroy]
>>>>>>> 6717707eca2fb192a28d4e16b622f0213b6ed846

  patch '/cart', :to => 'carts#increase'

  put '/cart', :to => 'carts#decrease'

  delete '/cart', :to => 'carts#destroy'

  get '/:category', to: 'categories#show', param: :slug, as: "category"
<<<<<<< HEAD
<<<<<<< HEAD



<<<<<<< HEAD
=======
resources :carts, only: [:index, :create, :destroy]
get '/:category', to: 'categories#show', param: :slug, as: "category"
>>>>>>> orders
=======
>>>>>>> 4900e9037b9832b31d31c9da1407e68b1a83cd9d
>>>>>>> orders
=======
  
>>>>>>> e739e133aaaf2b2d5c047e07ab3d8e759ec23e50
=======
  
<<<<<<< HEAD
  



>>>>>>> orders-2
=======
>>>>>>> 6717707eca2fb192a28d4e16b622f0213b6ed846
end

