Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :posts do
    resources :likes
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"

  get "/profile", to: "profile#index"
end
