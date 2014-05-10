Thankyou::Application.routes.draw do
  resource :dashboard, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root 'homes#show'
end
