Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destination', to: 'users/registrations#new_destination'
    post 'destination', to: 'users/registrations#create_destination'
    get 'logout', to: 'users/sessions#logout'
  end
  root 'products#index'
  resources :products, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get :search
      get :pay
      get :check
    end
  end
  
  resources :users, only: [:show, :edit] do
    collection do
      get :logout
    end
  end

  resources :credit_cards, only: [:new]
end