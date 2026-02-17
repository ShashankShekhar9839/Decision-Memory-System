Rails.application.routes.draw do
   get "/health", to: "health#index"
  resources :decisions, only: [:index, :create, :show, :update, :destroy]
end