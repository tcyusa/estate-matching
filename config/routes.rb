Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  get 'offers/:id/edit', to: 'offers#edit'
  post 'offers/:id/', to: 'offers#update'
  put 'offers/:id/', to: 'offers#update'
  
  get 'profiles/:id/edit', to: 'profiles#edit'
  post 'profiles/:id/', to: 'profiles#update'
  put 'profiles/:id/', to: 'profiles#update'
  
  resources :offers, only: [:show, :new, :create, :edit, :update] do
    member do
      get :cities
      get :choices
    end
  end

  resources :users, only: [:index, :show, :new, :create]
  resources :offers, only: [:edit, :update, :destroy]
  resources :profiles, only: [:edit, :update, :destroy]
  resources :messages, only: [:create]
  resources :entries, only: [:index, :show]
  resources :rooms, only: [:index, :show, :create]
end
