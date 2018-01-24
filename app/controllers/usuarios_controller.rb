class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy] #objetivo não repetir em toda as funções [:show, :edit, :update, :destroy]
  before_action :usuario_nao_logado, except: [:new, :create] #except: :index exceção redirecionando para pagina index
  before_action :usuario_logado, only: [:new, :create] # before_action são ações de funções declarad aqui e no helper
  before_action :usuario_correto, only: [:edit, :update]
  before_action :usuario_correto_ou_admin, only: :destroy



  # GET usuarios/novo
  def new
    @usuario = Usuario.new
  end

  # post usuarios/novo
  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      flash[:notice] = "Bem vindo à socialIN."
      log_in @usuario
    else
      flash.now[:notice] = "Algo errado aconteceu."
      render "new"
  end
end



  #GET Usuarios/1
  def show

  end

  #GET Usuarios/editar/1
  def edit
  end

  #PATCH Usuarios/editar/1
    def update
      if @usuario.update_attributes(usuario_params)
        redirect_to show_usuario_path(id: @usuario.id)
      else
        render "edit"
      end
    end

  #GET Usuarios
  def index
    @usuarios = Usuario.all
  end


  #DELETE Usuarios/1
  def destroy
    if @usuario.destroy
      redirect_to index_usuarios_path
    else
      redirect_to show_usuario_path(id: @usuario.id)
    end
  end

  private


  def set_usuario
      #find serve para encontrar um registro no DB pelo seu id apenas
    @usuario = Usuario.find(params[:id])
  end

  #este metotodo imprede que parametros indejesados no nosso db
  #boa pratica de segurança
  def usuario_params
    params.require(:usuario).permit(:nome, :sobrenome, :email, :data_nascimento,
    :telefone, :password, :password_confirmation, :avatar)
  end


  def usuario_correto
    if current_user != @usuario
      flash[:alert] = "Não permitido"
      redirect_to show_usuario_path(id: current_user.id)
    end
  end

  def usuario_correto_ou_admin
    if !current_user.admin && current_user != @usuario
      flash[:alert] = "Não permitido"
      redirect_to show_usuario_path(id: current_user.id)
    elsif current_user == @usuario &&   current_user.admin
      flash[:alert] = "Não permitido"
      redirect_to show_usuario_path(id: current_user.id)
    end
  end


end
