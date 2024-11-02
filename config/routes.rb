Rails.application.routes.draw do
  root "articles#index"

  # get "/articles", to: "articles#index" # RubyGS 4.2
  # get "/articles/:id", to: 'articles#show' # RubyGS 7.1
  resources :articles do # replaced above two lines RubyGS 7.2
    resources :comments # RubyGS 8.3
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
