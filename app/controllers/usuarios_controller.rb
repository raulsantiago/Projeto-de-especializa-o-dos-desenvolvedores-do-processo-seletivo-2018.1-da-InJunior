class UsuariosController < ApplicationController
  before_action :usuario_nao_logado, except: [:index, :new, :create] #except: :index exceção redirecionando para pagina index



  # GET usuarios/novo
  def new
    @usuario = Usuario.new
  end

  # post usuarios/novo
  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      redirect_to index_usuarios_path
    else
      render "new"
  end
end



  #GET Usuarios/1
  def show
    #find serve para encontrar um registro no DB pelo seu id apenas
    @usuario = Usuario.find(params[:id])
  end

  #GET Usuarios/editar/1
  def edit
    @usuario = Usuario.find(params[:id])
  end

  #PATCH Usuarios/editar/1
    def update
      @usuario = Usuario.find(params[:id])
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
    @usuario = Usuario.find(params[:id])
    if @usuario.destroy
      redirect_to index_usuarios_path
    else
      redirect_to show_usuario_path(id: @usuario.id)
    end
  end

  private

  #este metotodo imprede que parametros indejesados no nosso db
  #boa pratica de segurança
  def usuario_params
    params.require(:usuario).permit(:nome, :sobrenome, :email, :data_nascimento,
    :telefone, :password, :password_confirmation )
  end


end
