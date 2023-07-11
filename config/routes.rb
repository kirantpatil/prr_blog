Rails.application.routes.draw do
  
  resources :logins, only: %i[new create]
  resources :registrations, only: %i[new create]
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
