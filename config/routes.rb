TODO::Application.routes.draw do

  root :to => 'home#index'

  get 'perfil', to: 'users#show', as: 'show'
  get 'registrarse', to: 'users#new', as: 'signup'
  get 'entrar', to: 'sessions#new', as: 'login'
  delete 'salir', to: 'sessions#destroy', as: 'logout'

  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create]
  resources :tasks, :only => [:index, :new, :create] do
    resources :completions, :only => [:create]
  end

  get '*a', :to => 'errors#routing'
end
