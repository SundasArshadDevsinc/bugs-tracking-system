Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :projects do
      resources :bugs 
    end
  end
 
  put 'bugs/:id/assign', to: 'bugs#assign_bug', as: :assign
  

  root to: 'projects#index'
end
