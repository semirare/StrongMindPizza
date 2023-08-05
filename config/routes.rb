Rails.application.routes.draw do
  get 'static_page/home'
  get 'static_page/help'
  resources :toppings
  resources :pizzas
  root "pizzas#index"
end
