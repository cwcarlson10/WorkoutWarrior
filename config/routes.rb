Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }


  get 'routines/new'

  get 'routines/show'

  get 'routines/index'

  get 'routines/edit'


  root 'static_pages#home'

  get 'exercises' => 'exercises#index'
  get '/about', to: 'static_pages#about', as: :about


  resources :users, :only => [:show, :index]
  get '/profile', to: 'users#profile', as: :profile

  resources :programs
end
