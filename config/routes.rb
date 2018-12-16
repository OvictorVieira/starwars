Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resource :books
end
