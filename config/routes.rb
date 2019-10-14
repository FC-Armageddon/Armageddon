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

resources :users, only: [:update, :show, :edit]
post 'users/deleted/:id' => 'users#deleted_flag', as:'deleted_flag'
get 'users/admins_index' => "users#admins_index", as:'users_admins'
get 'users/admins/:id' => 'users#admins_show', as:'user_admins'
get 'users/admins_edit/:id' => 'users#admins_edit', as:'user_admins_edit'
post 'users/admins/:id' => 'users#admins_update', as:'user_admins_update'
post 'users/admins/deleted/:id' => 'users#admins_deleted_flag', as:'admins_deleted_flag'
resources :users, only: [:update, :show, :edit]

get 'cds/admins_index' => 'cds#admins_index', as:'cds_admins'
get 'cds/search', as: 'search'
get 'cds/admins/:id' => 'cds#admins_show', as:'cd_admins'
get 'cds/admins_edit/:id' => 'cds#admins_edit', as:'cd_adimns_edit'
post 'cds/admins/:id' => 'cds#admins_update', as:'cd_admins_update'
delete 'cds/admins/:id' => 'cds#admins_destroy', as:'cd_admins_destroy'
post 'cds/admins' => 'cds#admins_create', as:'cds_new_create'
get 'cds/admins_new' => 'cds#admins_new', as:'cds_new'
get 'cds/admins_search', as:'admins_search'
resources :cds, only: [:show]


resources :genres, only: [:create, :update]

resources :labels, only: [:create, :update]

resources :artists, only: [:create, :update]

resources :discs, only: [:create, :update]

resources :songs, only: [:create, :update]

resources :arrivals, only: [:create, :index]

resources :carts, only: [:index, :create, :destroy, :update]
post 'carts/deleted/:id' => 'carts#deleted_flag', as:'carts_deleted_flag'

resources :buy_informations, only: [:new, :create, :updates]

resources :sales_statuses, only: [:create, :updates]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
