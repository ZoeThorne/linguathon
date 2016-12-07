Rails.application.routes.draw do
  resources :user_achievements
	root to: 'users#index'
  resources :trainings
  resources :achievements
  resources :words
  devise_for :users
  get '/users/:id', to: 'users#show', as: 'user'
  get 'users/:user_id/trainings/:id/train', to: 'trainings#train', as: 'train'
  get '/api/trainings/:id/words', to: 'api_words#get_words', as: 'get_words'
  get '/api/trainings/:id/results', to: 'api_words#get_results', as: 'get_results'
  post '/api/trainings/:training_id/words/:word_id/check', to: 'api_words#check'
  get "/:page" => "static#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
