Rails.application.routes.draw do
  resources :comentarios
  resources :posts
  root to: "usuarios#index"


  # Sessoes controller
  get 'feed', to: "posts#feed", as: :feed
  resources :posts

  # Sessoes controller
  get 'login', to: "sessoes#new", as: :login
  post 'login', to: "sessoes#create"
  delete 'login', to: "sessoes#destroy", as: :logout



  # Usuarios controller
  get 'usuarios/novo', to: "usuarios#new", as: :new_usuario #novo é nome não é agumento
  post 'usuarios/novo', to: "usuarios#create" #criando no DB
  get 'usuarios/editar/:id', to: "usuarios#edit", as: :edit_usuario
  patch 'usuarios/editar/:id', to: "usuarios#update" #acesaar db para alteração pelo form


  get 'usuarios/:id', to: "usuarios#show", as: :show_usuario #id argumento
  # (:id parametros tem ser ultimo nos gets)
  delete 'usuarios/:id', to: "usuarios#destroy", as: :destroy_usuario
  get 'usuarios', to: "usuarios#index", as: :index_usuarios

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
