Rails.application.routes.draw do

  root to: "usuarios#index"

  # Redefinirsenhabusca controller
  get 'redefinir_senha/busca', to: "redefinir_senha_busca#busca", as: :redefinir_senha
  post 'redefinir_senha/busca', to: "redefinir_senha_busca#recuperar"


  # Comentarios controller
  resources :comentarios

  # Sessoes controller
  patch 'curtir/:post_id', to: "posts#curtir", as: :curtir
  patch 'descurtir/:post_id', to: "posts#descurtir", as: :descurtir
  get 'feed', to: "posts#feed", as: :feed
  resources :posts

  # Sessoes controller
  get 'login', to: "sessoes#new", as: :login
  post 'login', to: "sessoes#create"
  delete 'login', to: "sessoes#destroy", as: :logout

  # Usuarios controller
  patch 'buscacidades', to: "usuarios#buscacidades", as: :buscacidades
  get 'usuarios/novo', to: "usuarios#new", as: :new_usuario #novo é nome não é agumento
  post 'usuarios/novo', to: "usuarios#create" #criando no DB
  get 'usuarios/editar/:id', to: "usuarios#edit", as: :edit_usuario
  patch 'usuarios/editar/:id', to: "usuarios#update" #acesaar db para alteração pelo form

  get 'usuarios/:id', to: "usuarios#show", as: :show_usuario #id argumento
  # (:id parametros tem ser ultimo nos gets)
  delete 'usuarios/:id', to: "usuarios#destroy", as: :destroy_usuario
  get 'usuarios', to: "usuarios#index", as: :index_usuarios

end
