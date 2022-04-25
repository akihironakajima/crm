Rails.application.routes.draw do
  root to: "sessions#new"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :estimates do
    member do
      get :matchings
      post :matchings, to: "matchings#create"
    end
  end
  resources :partners
  resources :matchings, only: [:create]
end
