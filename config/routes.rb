Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "recipes#index"

  resources :users do
    resources :recipes
  end

  resources :recipes
  resources :categories
  resources :ingredients

end
