Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks"  }

  get '/about', to: 'static_pages#about', as: :about
  get '/role', to: 'static_pages#role', as: :role

  get '/programs/:id/athletes', to: 'programs#program_athletes', as: :program_athletes

  put '/programs/:id', to: 'programs#add_athlete_to_program', as: :assign_to_program
  delete '/programs/:id', to: 'programs#remove_athlete_from_program', as: :remove_from_program

  resources :users, :only => [:show, :index]
  get '/profile', to: 'users#profile', as: :profile

  resources :programs do
    resources :routines
  end

  resources :activities

  patch '/assign_trainer', to: 'athletes#assign_trainer', as: :assign_trainer

  resources :trainers, :athletes
  get 'my_athletes/:id', to: 'trainers#trainer_athletes', as: :trainer_athletes

  root 'static_pages#home'

end
