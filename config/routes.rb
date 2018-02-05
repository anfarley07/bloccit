Rails.application.routes.draw do
 resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
  end

  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'

  post 'users/confirm' => 'users#confirm'

  post 'users/new' => 'users#new'

  root 'welcome#index'

end
