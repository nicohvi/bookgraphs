Rails.application.routes.draw do

  root 'books#index'

  concern :commentable do
    resources :comments, only: [:create]
  end

  resources :graphs, concerns: :commentable, only: [:show, :destroy] do
    resources :plot_points, concerns: :commentable
  end

  resources :books do
    resources :graphs, except: [:show]
  end

end
