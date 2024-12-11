Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  # Show route now requires the key (returned from API) instead of id, as books not in DB will not have an id
  # get 'books/:key', to: 'books#show', as: 'book'

  # Same as above: nested routes all need the key rather than the id otherwise it will crash is the book not in DB
  resources :books, param: :key, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :reading_lists, only: [:create]
  end

  resources :reading_lists, only: [:index, :show]
  patch "/reading_lists/:id", to: "reading_lists#deactivate", as: :deactivate

end
