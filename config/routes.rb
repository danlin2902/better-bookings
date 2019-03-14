Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :bookings, except: [:show, :index]
    resources :reviews
  end
    resources :bookings, only: [:index, :show]
end
