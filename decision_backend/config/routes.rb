Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :decisions
      get "health", to: "health#index"
    end
  end
end