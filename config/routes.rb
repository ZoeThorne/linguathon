Rails.application.routes.draw do
	root to: 'users#index'
  resources :trainings
  resources :achievements
  resources :words
  devise_for :users
  get '/users/:id', to: 'users#show', as: 'user'
  get 'users/:user_id/trainings/:id/train', to: 'trainings#train', as: 'train'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
