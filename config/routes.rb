Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/index'
  get 'sessions/logout'
  post 'sessions/validLogin'
  post 'question_papers/add_question'
  post 'question_papers/score'
  get 'question_papers/choose_subject'
  get 'question_papers/selected_list'
  get 'sessions/relogin'
  resources :sessions , only: [:new]
  resources :users , only: [:new,:create,:show]
  resources :question_papers , only: [:new,:index]
  root 'sessions#new'
end
