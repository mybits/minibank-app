Minibank::Application.routes.draw do
  
  root to: 'clients#index'
  
  resources :clients do
    resources :accounts
  end
end
