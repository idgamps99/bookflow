Rails.application.routes.draw do
  devise_for :users
  # Routes to discover page
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :reading_lists, only: [:index, :show] do
    resources :trackers, only: [:new, :create]
  end

  # Nested routes all need the key rather than the id otherwise it will crash if the book not in DB
  resources :books, param: :key, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :reading_lists, only: [:create]
  end

  patch "/reading_lists/:id", to: "reading_lists#deactivate", as: :deactivate


  resources :trackers, only: [:show, :update] do
    resources :reading_sessions, only: [:new, :create, :edit, :update]
  end

  # resources :reading_sessions, only: [:edit, :update]
end
