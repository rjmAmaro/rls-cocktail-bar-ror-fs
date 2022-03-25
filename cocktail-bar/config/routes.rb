Rails.application.routes.draw do

  root 'categories#index'

  get 'search', to: 'cocktails#search'
  put 'set_like', to: 'cocktails#set_like'
  put 'set_like_show', to: 'cocktails#set_like_show'
  put 'set_rate', to: 'cocktails#set_rate'
  resources :categories do
    resources :cocktails do
      resources :ingredients
    end
  end
end