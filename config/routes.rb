TODO::Application.routes.draw do


  get 'perfil', to: 'users#show', as: 'show'
  get 'registrarse', to: 'users#new', as: 'signup'
  get 'entrar', to: 'sessions#new', as: 'login'
  delete 'salir', to: 'sessions#destroy', as: 'logout'


  root :to => 'home#index'
  resources :users
  resources :sessions
  resources :tasks, :only => [:index, :new, :create] do
    resources :completions, :only => [:create]
  end
end
