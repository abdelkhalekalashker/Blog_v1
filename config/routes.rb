Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/about' ,to: 'pages#about'
  # Defines the root path route ("/")
   root "pages#index"
end
