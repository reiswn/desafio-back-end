Rails.application.routes.draw do
  root "home#index"
  resources :transactions
  resources :transaction_types
  post "transactions/upload", to: "transactions#upload"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
