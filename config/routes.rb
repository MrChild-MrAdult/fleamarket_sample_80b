Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :search, :show, :new, :create, :edit, :update] do
    collection do
      get :pay
      get :check
    end
  end
end