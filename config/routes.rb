Rails.application.routes.draw do
  resources :events, only: %i[index show new create]
  resources :users, only: %i[show]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "events#index"
end
