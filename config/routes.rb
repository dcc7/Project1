Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "u/:username" => "profile#index", as: :profile
  root to: "public#index"

  resources :communities do
    resources :posts
  end
end
