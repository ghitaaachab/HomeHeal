Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "pages#home"

  get "listings/", to: "listings#index"

  resources :listings, only: [:index, :show] do
    post 'book_appointment', on: :member
    get 'disabled_dates', on: :member
  end

  resources :appointments, only: [:index, :create, :update] do
    member do
      put :accept
      put :reject
    end
  end

  resources :roles, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # Defines the root path route ("/")
  # root "posts#index"
end
