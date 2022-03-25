# frozen_string_literal: true

Rails.application.routes.draw do
  root 'categories#index'

  get 'search', to: 'cocktails#search'
  post 'create', to: 'cocktails#create'
  post 'set_like', to: 'cocktails#set_like'
  get 'cocktail_form', to: 'cocktails#cocktail_form'

  resources :categories do
    resources :cocktails do
      get 'add_ingredient_form', to: 'cocktails#add_ingredient_form'
      post 'add_ingredient', to: 'cocktails#add_ingredient'
      resources :ingredients
    end
  end
end
