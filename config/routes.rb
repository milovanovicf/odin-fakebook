Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :posts
  resources :likes
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"

  get "/profiles/:user_id", to: "profiles#show", as: :profile
  get "/profiles", to: "profiles#index"
  get "/friends", to: "profiles#friends"

  post "follow/account", to: "profiles#follow_account", as: :follow_account
end
