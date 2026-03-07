Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :decisions
      get "health", to: "health#index"
      post "register", to: "auth#register"
      post "login", to: "auth#login"
    end
  end
end