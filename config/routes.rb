Rails.application.routes.draw do
  root to: "users#welcome"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/recipes/most_ingredients', to: 'recipes#most_ingredients', as: "recipes_most_ingredients"
  get '/recipes/:id/ingredients', to: 'recipe_ingredients#index'
  get '/recipes/:id/ingredients/new', to: 'recipe_ingredients#new', as: "recipe_ingredient_new"

  get '/users/:user_id/recipes', to: 'users#recipes'
  get '/ingredients/sort_abc', to: 'ingredients#sort_ABC'
  get '/ingredients/sort_by_popularity', to: 'ingredients#sort_by_popularity'
  get '/auth/google_oauth2/callback' => 'sessions#create_with_google'

  resources :users do
    collection do
      get :most_recipes
    end
  end
  resources :sessions

  resources :recipes

  resources :categories do
    collection do
      get :sort_by_popularity
      get :sort_ABC
    end
  end

  resources :ingredients, only: [:index, :show]
  resources :recipe_ingredients

end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
