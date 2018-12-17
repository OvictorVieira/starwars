Rails.application.routes.draw do
  devise_for :users
  root 'films#index'
  resource :films, only: [:index]
  resource :evaluations, only: [:index, :create, :update]
end
