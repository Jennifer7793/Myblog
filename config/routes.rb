Rails.application.routes.draw do
  devise_for :users
  resources :blogs do
    resources :articles, shallow: true
  end
  get "/search", to: "blogs#show"
  get "welcome/index"
  root to: "welcome#index"
  post "/user_blog", to: "user_blogs#change_role"
end
