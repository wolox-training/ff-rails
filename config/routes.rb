Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]
      resources :rents, only: [:index, :create]
      resources :book_suggestions, only: [:create]
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'
end
