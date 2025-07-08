Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :users, only: [:index, :show], param: :username do
    resources :profiles, only: [] do
      member do
        patch 'bio'
        patch 'avatar'
      end
    end
  end
  root 'posts#index'
  resources :posts, except: [:new] do 
    resources :comments, only: [:edit, :create, :update, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
