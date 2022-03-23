Rails.application.routes.draw do

  resources :categories do
    resources :cocktails
  end
end