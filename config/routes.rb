Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  get 'login', to: 'users#login_form', as: 'login'
  post '/login', to: 'users#login'

  resources :works
  resources :users
  
  post '/votes/:work_id', to: 'votes#create', as: 'votes'


  # resources :works do
  #   resources :user, only: [:show, :edit, :delete]
  # end

end
