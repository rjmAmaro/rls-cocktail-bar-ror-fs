Rails.application.routes.draw do

  root 'categories#index'

  get 'search', to: 'cocktails#search'

  resources :categories do
    resources :cocktails do
      resources :ingredients
    end
  end
end