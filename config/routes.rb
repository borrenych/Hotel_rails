Rails.application.routes.draw do
  resources :bookings
  resources :reviews
  root to: 'reviews#home'
  devise_for :users
  resources :rooms, only: %i[index show]

  namespace :admin do
    resources :rooms
    resources :reviews do
      member do
        put :accept
      end
    end
    resources :bookings do
      member do
        put :settrue
      end
      member do
        put :setfalse
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
