Rails.application.routes.draw do
  root "calculators#index"

  resources :calculators, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
