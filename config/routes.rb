Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show] do
    resources :friendships, only: [:create, :destroy, :show]
  end
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # update friendship request
  patch '/users/:user_id/friendships/:id', to: 'friendships#update', as: 'update_friendship'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
