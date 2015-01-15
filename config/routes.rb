Rails.application.routes.draw do

  get 'trainers/index'

  get 'trainers/show'

  get 'trainers/new'

  get 'trainers/edit'

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'static_pages#home'

  get 'exercises' => 'exercises#index'
  get '/about', to: 'static_pages#about', as: :about

  resources :users, :only => [:show, :index]
  get '/profile', to: 'users#profile', as: :profile

  resources :programs
  resources :routines
  resources :trainers

end