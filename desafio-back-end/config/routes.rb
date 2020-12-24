Rails.application.routes.draw do
  root "home#index"
  resources :transactions
  resources :transaction_types
  post "transactions/upload", to: "transactions#upload"
  get "stores" => "stores#index"
  get "stores/:store_name" => "stores#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
