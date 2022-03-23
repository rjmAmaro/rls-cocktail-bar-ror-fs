Rails.application.routes.draw do

  resources :categories do
    resources :cocktails do
      resources :ingredients
    end
  end
end