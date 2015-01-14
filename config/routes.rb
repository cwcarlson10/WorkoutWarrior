Rails.application.routes.draw do

  get 'routines/new'

  get 'routines/show'

  get 'routines/index'

  get 'routines/edit'

  devise_for :users
  root 'static_pages#home'

  get 'exercises' => 'exercises#index'
  get '/about', to: 'static_pages#about', as: :about

  resources :programs


end
