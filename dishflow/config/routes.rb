Rails.application.routes.draw do

  resources :special_dishes
  resources :ratings
  devise_for :users do
    get 'sign_in', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :accounts

  root to: "statics#home"

  resources :recipes

  resources :menus do

    resources :lists do
      member do
        patch  :move
      end
    end

    resources :foods do
      member do
        patch  :move
      end

      resources :reviews
    end
  end

  get "/", to: "statics#home", as: :home

end
