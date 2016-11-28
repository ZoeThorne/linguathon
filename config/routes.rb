Rails.application.routes.draw do
  resources :trainings
  resources :achievements
  resources :words
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
