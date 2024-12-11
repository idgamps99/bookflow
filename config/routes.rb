Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :books, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  get 'discover', to: 'discover#index', as: 'discover'
  resources :reading_lists, only: [:index, :show] do
    resources :trackers, only: [:new, :create]
  end

  patch "/reading_lists/:id", to: "reading_lists#deactivate", as: :deactivate

  resources :books, only: [:index, :show] do
    resources :reading_lists, only: [:create]
  end

  resources :trackers, only: [:show, :update] do
    resources :reading_sessions, only: [:new, :create, :edit, :update]
  end

  # resources :reading_sessions, only: [:edit, :update]
end
