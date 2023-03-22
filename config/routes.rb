Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]

      resources :sleep_trackers, only: [:index, :create, :update]

      resources :follows, only: [:create, :destroy]
    end
  end
end
