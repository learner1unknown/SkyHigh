Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users

  root to: "aircrafts#index"

  resources :aircrafts do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]

    collection do
      get :my_aircraft
    end
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: %i[update edit destroy show index] do
    member do
      get :accept
      get :decline
    end
  end
end
