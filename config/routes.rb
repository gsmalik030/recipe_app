Rails.application.routes.draw do
  get 'general_shopping_list/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root 'users#index'

  resources :recipes do
    resources :food_recipes, only: %i[new create]
  end

  resources :food_recipes
  resources :foods
  resources :users

  get 'public_recipes', to: 'public_recipe#index'
end
