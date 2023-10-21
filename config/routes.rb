Rails.application.routes.draw do
  devise_for :users

  resources :workouts do
    resources :training_sets
  end

  resources :exercises

  get '/app', to: 'home#index'

  root 'home#index'
end
