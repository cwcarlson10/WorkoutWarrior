Rails.application.routes.draw do

  get 'athletes/new'

  get 'athletes/edit'

  devise_for :users, :controllers => { registrations: 'registrations' }

  get '/exercises' => 'exercises#index'

  get '/about', to: 'static_pages#about', as: :about
  get '/role', to: 'static_pages#role', as: :role

  resources :users, :only => [:show, :index]
  get '/profile', to: 'users#profile', as: :profile

  resources :programs do
    resources :routines
  end

  patch '/assign_trainer', to: 'athletes#assign_trainer', as: :assign_trainer

  resources :trainers, :athletes

  root 'static_pages#home'

end
