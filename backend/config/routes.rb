Rails.application.routes.draw do
  get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"

  resources :posts, only: [:index, :create, :destroy, :update]
  resources :follows, only: [:create]
  delete '/unfollow', to: 'follows#destroy'

  # Defines the root path route ("/")
  # root "posts#index"
end
