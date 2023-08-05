Rails.application.routes.draw do
  resources :toppings
  resources :pizzas
  root "pizzas#index"
end
