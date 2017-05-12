Rails.application.routes.draw do
  
  get 'downgrades/new'

  # resources instructs Rails to create wiki routes for creating, updating, viewing, and deleting instances of Wiki
  resources :wikis

  get 'about' => 'welcome#about'
  
  root 'welcome#index'
  
  devise_for :users
  
  resources :charges, only: [:new, :create]
  
  resources :downgrades, only: [:new, :create]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

end
