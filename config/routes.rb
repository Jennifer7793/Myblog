Rails.application.routes.draw do
  devise_for :users
  resources :blogs do
    resources :articles, shallow: true
  end
  get "welcome/index"
  root to: "welcome#index"
end
