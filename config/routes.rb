Rails.application.routes.draw do
  devise_for :users
  root 'films#index'
  resource :films, only: [:index]

  get 'evaluations' => 'evaluations#index', as: :list_evaluations
  post 'evaluations/:film_api_id/:evaluation' => 'evaluations#create', as: :create_evaluations
  delete 'evaluations/:evaluation_id' => 'evaluations#destroy', as: :destroy_evaluations
  put 'evaluations/:film_api_id/:evaluation' => 'evaluations#update', as: :update_evaluations
end
