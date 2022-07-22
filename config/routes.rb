Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    resources :likes, only: %w[create destroy]
  end
  root to: "tweets#index"
end
