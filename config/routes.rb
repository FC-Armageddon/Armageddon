Rails.application.routes.draw do

root :to => 'cds#index'

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

post 'buy/:id' => 'buy_informations#update'

patch 'users/deleted/:id' => 'users#deleted_flag', as:'deleted_flag'
get 'users/admins_index' => "users#admins_index", as:'users_admins'
get 'users/admins/:id' => 'users#admins_show', as:'user_admins'
get 'users/admins_edit/:id' => 'users#admins_edit', as:'user_admins_edit'
post 'users/admins/:id' => 'users#admins_update', as:'user_admins_update'
patch 'users/admins/deleted/:id' => 'users#admins_deleted_flag', as:'admins_deleted_flag'
resources :users, only: [:update, :show, :edit, :destroy]


get 'cds/admins_index' => 'cds#admins_index', as:'cds_admins'
get 'cds/search', as: 'search'
get 'cds/admins/:id' => 'cds#admins_show', as:'cd_admins'
get 'cds/admins_edit/:id' => 'cds#admins_edit', as:'cd_admins_edit'
patch 'cds/admins/:id' => 'cds#admins_update', as:'cd_admins_update'
patch 'cds/admins_delete/:id' => 'cds#admins_destroy', as:'cd_admins_destroy'
post 'cds/admins' => 'cds#admins_create', as:'cds_new_create'
post 'cd/cart/:id' => 'cds#cart_create', as: 'cd_cart'
get 'cds/admins_new' => 'cds#admins_new', as:'cds_new'
get 'cds/admins_search', as:'admins_search'
resources :cds, only: [:show] do
	resource :reviews, only: [:create, :destroy]
	resource :favorites, only: [:create, :destroy]
end

resources :genres, only: [:create, :update]

resources :labels, only: [:create, :update]

resources :artists, only: [:create, :update]

resources :discs, only: [:create, :update]

resources :songs, only: [:create, :update]

resources :arrivals, only: [:create, :index]

patch 'carts/deleted/:id' => 'carts#deleted_flag', as:'carts_deleted_flag'
post 'carts/:id'  => 'carts#update', as:'cart'
resources :carts, only: [:index, :destroy]


resources :buy_informations, only: [:new, :create]

resources :sales_statuses, only: [:create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
