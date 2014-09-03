Rails.application.routes.draw do
  root 'books#index', as: :books
  resources :books, only: [] do
    collection do
      get :read
      get :to_read
      get :not_interested
      get :other
    end
  end
end
