Rails.application.routes.draw do
  resources :posts do
    get :show_comments, on: :member
  end

  resources :plans, only: [:index, :create]
  root 'posts#index'
end
