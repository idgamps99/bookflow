Rails.application.routes.draw do
  devise_for :users
  # Routes to discover page
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :reading_lists, only: [:index, :show] do
    member do
      patch :mark_as_read
    end
    resources :trackers, only: [:new, :create]
  end

  # Nested routes all need the key rather than the id otherwise it will crash if the book not in DB
  resources :books, param: :key, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :reading_lists, only: [:create] do
      collection do
        post :create_read
      end
    end
  end

  get "/genres", to: "books#genres_index"
  patch "/reading_lists/:id", to: "reading_lists#deactivate", as: :deactivate

  resources :trackers, only: [:index, :update] do
    resources :reading_sessions, only: [:new, :create, :edit, :update]
  end
end
