# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root 'pages#home' #expect a hello method in the applications controller
  get 'about', to: 'pages#about'
  resources :articles #, only: [ :show, :index, :new, :create, :edit, :update, :destroy ]
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: [ :new ]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end



#generate a view, conventional expectations

# define a route that points to controller#action
# have a named controller
# have a named action/method
# if done this way, rails expects a pages folder and template