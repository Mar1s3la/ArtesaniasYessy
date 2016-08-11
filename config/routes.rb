Rails.application.routes.default_url_options[:host] = 'http://artesaniasyessy.herokuapp.com'
Rails.application.routes.draw do
  resources :catalogo, only: [:index]
  resource :item, only: [:show]
  resources :vent_items, only: [:create, :update, :destroy]
  resources :vents
  resources :clientes
  resources :orders

  devise_for :admins
  devise_for :empleados
  root "static#main"

  post "/deactivate", to: "empleados#deactivate"

  resources :empleados, only: [:index, :show, :edit]


  resources :disenos
  resources :categories
  resources :tamanos
  resources :productos
end
