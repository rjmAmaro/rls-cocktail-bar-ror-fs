Rails.application.routes.draw do

  root 'categories#index'

  get 'search', to: 'cocktails#search'
  put 'set_like', to: 'cocktails#set_like'
  put 'set_like_show', to: 'cocktails#set_like_show'
  put 'set_rate_one', to: 'cocktails#set_rate_one'
  put 'set_rate_two', to: 'cocktails#set_rate_two'
  put 'set_rate_three', to: 'cocktails#set_rate_three'
  put 'set_rate_four', to: 'cocktails#set_rate_four'
  put 'set_rate_five', to: 'cocktails#set_rate_five'
  resources :categories do
    resources :cocktails do
      resources :ingredients
    end
  end
end