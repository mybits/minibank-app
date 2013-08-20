Minibank::Application.routes.draw do
  
  resources :posts

  root to: 'sessions#new'
  resources :sessions
  get 'login' => 'sessions#new', :as => 'login'
	get 'logout' => 'sessions#destroy', :as => 'logout'
  
  resources :clients do
    resources :accounts
    resources :posts
  end

  resources :accounts do
    resources :transactions
  end
end
