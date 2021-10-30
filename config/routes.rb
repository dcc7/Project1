Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public#home"
  get "u/:username" => "public#profile", as: :profile

  # nested the posts into communities for the url parameters.
  resources :communities do
    resources :posts
  end

  resources :posts

  resources :comments, only: [:create, :destroy]

  resources :public, only: [:index]
  resources :subscriptions
  #resources :comments, only: [:create, :destroy]

  resources :drivers
  resources :tracks
end
