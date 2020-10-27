Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :search, :show, :new, :create, :edit, :update] do
    collection do
      get :pay
      get :check
    end
  end
end