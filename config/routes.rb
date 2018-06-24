Rails.application.routes.draw do
  root to: "users#welcome"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  get '/recipes/:id/ingredients', to: 'recipes#ingredients'

  get 'users/:user_id/recipes', to: 'users#recipes'
  get 'ingredients/sort_abc', to: 'ingredients#sort_ABC'
  get '/auth/google_oauth2/callback' => 'sessions#create_with_google'

  resources :users do
    collection do
      get :most_recipes
    end
  end
  resources :sessions

  resources :recipes do
    resources :ingredients
  end
  resources :categories do
    collection do
      get :sort_by_popularity
      get :sort_ABC
    end
  end

  resources :ingredients, only: [:index, :show]

  # resources :users do
  #   resources :recipes, only: [:index, :show]
  # end

end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
