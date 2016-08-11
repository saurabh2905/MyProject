Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/index'
  get 'sessions/logout'
  post 'sessions/valid_login'
  post 'question_papers/score'
  get 'sessions/relogin'
  get 'users/my_profile'
  resources :answers , only: [:index]
  resources :solutions , only: [:create,:index]
  resources :problems ,only: [:new, :index, :create]
  resources :sessions , only: [:new]
  resources :users , only: [:new,:create]
  resources :question_papers , only: [:new,:index]
  root 'sessions#new'
end
