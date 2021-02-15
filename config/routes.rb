Myapp::Application.routes.draw do

  resources :marcas
  
  resources :modelos
  post 'modelos/get_modelos', to: 'modelos#get_modelos'
  
  resources :clientes 
  get '/search_cliente', to: "clientes#search"
  post 'clientes/verificar', to: "clientes#verificar"
  
  resources :assinaturas
  get 'assinaturas/index/:cliente_id', to: 'assinaturas#index', as: :cliente_assinaturas
 
  root to: 'static#index'
  
end


