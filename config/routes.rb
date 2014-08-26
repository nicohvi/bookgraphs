Rails.application.routes.draw do

  resources :books do
    resources :graphs
  end

  root 'books#index'

end
