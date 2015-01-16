Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'static_pages#home'

  get 'exercises' => 'exercises#index'
  get '/about', to: 'static_pages#about', as: :about

  resources :users, :only => [:show, :index]
  get '/profile', to: 'users#profile', as: :profile

  resources :programs do
    resources :routines
  end

  resources :trainers

end