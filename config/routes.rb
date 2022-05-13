Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :events
  resources :events do
    member do
      get 'join'
      get 'leave'
    end
  end
  resources :users, only: %i[show]

  root to: "events#index"
end
