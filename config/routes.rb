Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
  resources :events, only: [:create]
  end

  resources :registered_applications
  
  root 'welcome#index'

  get 'welcome/about'

end
