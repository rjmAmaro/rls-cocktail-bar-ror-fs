# frozen_string_literal: true

Rails.application.routes.draw do
  root 'categories#index'

  get 'search', to: 'cocktails#search'
  post 'create', to: 'cocktails#create'
  get 'cocktail_form', to: 'cocktails#cocktail_form'
  put 'set_like', to: 'cocktails#set_like'
  put 'set_like_show', to: 'cocktails#set_like_show'
  put 'set_rate_one', to: 'cocktails#set_rate_one'
  put 'set_rate_two', to: 'cocktails#set_rate_two'
  put 'set_rate_three', to: 'cocktails#set_rate_three'
  put 'set_rate_four', to: 'cocktails#set_rate_four'
  put 'set_rate_five', to: 'cocktails#set_rate_five'
  get 'cocktail_favorites', to: 'cocktails#favorites'

  resources :categories do
    resources :cocktails do
      get 'add_ingredient_form', to: 'cocktails#add_ingredient_form'
      post 'add_ingredient', to: 'cocktails#add_ingredient'
      resources :ingredients
    end
  end
end
