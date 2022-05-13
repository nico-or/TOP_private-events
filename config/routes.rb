Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :events, only: %i[index show new create edit]
  resources :events do
    member do
      get 'join'
      get 'leave'
    end
  end
  resources :users, only: %i[show]

  root to: "events#index"
end
