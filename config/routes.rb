Rails.application.routes.draw do
  root to: "users#welcome"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    collection do
      get :most_recipes
    end
  end
  resources :sessions
  resources :recipes #, only: [:new, :create, :update, :destroy]
  resources :categories do
    collection do
      get :sort_by_popularity
      get :sort_ABC
    end
  end
  resources :ingredients

  # resources :users do
  #   resources :recipes, only: [:index, :show]
  # end

  get 'users/:user_id/recipes', to: 'users#recipes'

  get '/auth/google_oauth2/callback' => 'sessions#create_with_google'

end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
