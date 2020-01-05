Rails.application.routes.draw do
  devise_for :users

  get '/profile', to: 'dashboard#profile'

  resources :entities, only: %i(new create edit update)
  resources :invoices, only: %i(show new create edit update)

  root 'dashboard#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
