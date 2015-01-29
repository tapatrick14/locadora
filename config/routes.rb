Rails.application.routes.draw do
  devise_for :employees
  root to: "home#index"
  resources :customers
  resources :actors
  resources :movies do
    resources :rents
  end
end
