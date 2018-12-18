Rails.application.routes.draw do
  devise_for :users
  root 'films#index'
  resource :films, only: [:index]

  resource :evaluations, only: [:index]
  post 'evaluations/:film_api_id/:evaluation' => 'evaluations#create', as: :create_evaluations
  put 'evaluations/:film_api_id/:evaluation' => 'evaluations#update', as: :update_evaluations
end
