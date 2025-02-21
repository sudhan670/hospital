Rails.application.routes.draw do
  root 'appointments#index'

  resources :appointments do
    collection do
      get 'upcoming'
      get 'past'
    end
  end

  resources :patients do
    resources :appointments, only: [:index, :new, :create]
  end

  resources :doctors do
    resources :appointments, only: [:index, :new, :create]
  end

  resources :specialties
end
