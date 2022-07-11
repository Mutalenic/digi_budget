Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/new'
  get 'categories/index'
  get 'categories/new'
  get 'pages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "pages#index"
end
