Rails.application.routes.draw do
  root "pizzas#index"
  get '/about', to: 'static_page#about'
  get '/pizzas', to: 'pizzas#index'
  get '/toppings', to: 'toppings#index'
  resources :pizza_toppings
  resources :toppings
  resources :pizzas
end
