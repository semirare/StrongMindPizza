Rails.application.routes.draw do
  root "static_page#home"
  get '/home', to: 'static_page#home'
  get '/help', to: 'static_page#help'
  get '/about', to: 'static_page#about'
  get '/pizzas', to: 'pizzas#index'
  get '/toppings', to: 'toppings#index'
  resources :toppings
  resources :pizzas
end
