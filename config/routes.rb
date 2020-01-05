Rails.application.routes.draw do

  resources :entities, only: %i(new create edit update)
  resources :invoices, only: %i(show new create edit update)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
