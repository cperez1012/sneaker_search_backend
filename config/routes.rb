Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
    # namespace :v2 do
      resources :users
      resources :sneakers, only: [:index, :create, :update, :destroy, :show]
      resources :categories, only: [:index]
    end
  end
end
