VirtualLibrary::Application.routes.draw do


  resources :users, except: [:index, :destroy]
  resources :sessions
  
  resources :books do
    resources :reviews, except: [:edit, :update, :destroy]
    post 'borrow', on: :member
  end

  resources :book_histories

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get "users/edit"

  get "sesssions/create"
  get "sessions/destroy"


 
  root to:  'books#index'
  resources :pages, except: [:index, :destroy]
  resources "contacts", only: [:new, :create]

end
