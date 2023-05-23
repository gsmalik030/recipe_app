Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations:'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  root 'users#index'
  resources :food_recipes
  resources :recipes
  resources :foods
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
