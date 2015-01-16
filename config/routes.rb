Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  get '/about', to: 'static_pages#about', as: :about
  get '/role', to: 'static_pages#role', as: :role

  resources :users, :only => [:show, :index]
    get '/profile', to: 'users#profile', as: :profile

  resources :programs do
    resources :routines
  end

  resources :trainers, :athletes

  root 'static_pages#home'

end
