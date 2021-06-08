Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  root :to => 'sessions#welcome'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#index'
  get 'logout', to: 'sessions#out'

  get '/users' => 'users#new', as: 'users_new'
  post '/users' => 'users#create', as: 'users_create'

  get '/categories' => 'categories#new', as: 'categories_new'
  post '/categories' => 'categories#create', as: 'categories_create'
  delete '/categories/:id' => 'categories#delete', as: 'categories_delete'
  
  get '/categories/change/:id' => 'categories#change', as: 'categories_change'
  post '/categories/change' => 'categories#change'
  put '/categories/change/:id' => 'categories#update', as: 'categories_update'
  
  get '/tasks' => 'tasks#new'
  get '/tasks/:id' => 'tasks#new', as: 'tasks_new'
  delete '/tasks/:id' => 'tasks#delete', as: 'tasks_delete'
  put '/tasks/:id' => 'tasks#finish', as: 'tasks_finish'

  get '/tasks/new' => 'tasks#new'
  post '/tasks/new' => 'tasks#create', as: 'tasks_create'

  get '/tasks/change/:id' => 'tasks#change', as: 'tasks_change'
  post '/tasks/change' => 'tasks#change'
  put '/tasks/change/:id' => 'tasks#update', as: 'tasks_update'
end
