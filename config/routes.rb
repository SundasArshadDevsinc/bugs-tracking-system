Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :projects do
      resources :bugs
    end
  end

  root to: 'projects#index'
end
