Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :attendances, only: %i[create destroy]

  resources :events

  resources :users, only: %i[show]

  root to: "events#index"
end
