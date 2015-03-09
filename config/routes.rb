Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks"  }

  get '/about', to: 'static_pages#about', as: :about
  get '/contact', to: 'static_pages#contact', as: :contact
  get '/role', to: 'static_pages#role', as: :role

  get '/programs/:id/athletes', to: 'programs#program_athletes', as: :program_athletes

  put '/add_athlete/:id', to: 'programs#add_athlete_to_program', as: :assign_to_program
  get '/remove_athlete/:id', to: 'programs#remove_athlete_from_program', as: :remove_from_program


  resources :users, :only => [:show, :index]
  get '/profile', to: 'users#profile', as: :profile

  resources :programs do
    resources :routines
  end
  resources :exercises

  resources :activities

  put '/assign_trainer/id', to: 'trainers#assign_trainer', as: :assign_trainer
  put '/unassign_trainer/id', to: 'athletes#remove_from_trainer', as: :remove_from_trainer

  resources :trainers, :athletes
  get 'my_athletes/:id', to: 'trainers#trainer_athletes', as: :trainer_athletes


  get 'back', to: 'trainers#back_button'

  root 'static_pages#home'
end
