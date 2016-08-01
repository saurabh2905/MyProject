Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'logins/index'
  get 'logins/logout'
  post 'logins/validLogin'
  post 'question_papers/add_question'
  post 'question_papers/score'
  resources :logins
  resources :question_papers 
  root 'logins#index'
end
