Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :sneakers, only: [:index, :create, :update, :destroy]
      resources :categories, only: [:index]
    end
  end
end
