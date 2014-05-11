Thankyou::Application.routes.draw do
  resource :dashboard, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :cards, only: [:new, :create, :edit, :update, :show]
  root 'homes#show'
end
