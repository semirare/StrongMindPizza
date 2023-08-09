Rails.application.routes.draw do
  root "static_page#home"
  get '/about', to: 'static_page#about'
  get '/pizzas', to: 'pizzas#index'
  get '/toppings', to: 'toppings#index'
  resources :pizza_toppings
  resources :toppings
  resources :pizzas
end
