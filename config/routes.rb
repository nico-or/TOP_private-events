Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :events, only: %i[index show new create]
  resources :users, only: %i[show]

  root to: "events#index"
end
