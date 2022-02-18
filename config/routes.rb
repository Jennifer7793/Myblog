Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  get "welcome/index"
  root to: "welcome#index"
end
