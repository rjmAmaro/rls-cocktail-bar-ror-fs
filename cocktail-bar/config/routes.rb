Rails.application.routes.draw do

  root 'categories#index'

  resources :categories do
    resources :cocktails do
      resources :ingredients
    end
  end
end