Rails.application.routes.draw do
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