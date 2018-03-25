Rails.application.routes.draw do
  root to: "recipes#index"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :recipes
  resources :categories
  resources :ingredients

  resources :users do
    resources :recipes
  end

  get '/auth/:facebook/callback' => 'sessions#create_with_facebook'

end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
