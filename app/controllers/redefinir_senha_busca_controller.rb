class RedefinirSenhaBuscaController < ApplicationController

  # GET redefinir_senha_busca/busca
  def busca
  end

  # POST  redefinir_senha_busca/busca
  def recuperar
    usuario = Usuario.find_by(email: params[:usuario][:email])
    if usuario

        senha = Passgen::generate(:length => 6)
        usuario.password = senha
        usuario.password_confirmation = senha
        usuario.save

        UsuarioMailer.esqueci_minha_senha(usuario, senha).deliver_now
        flash[:notice] = "Email com instruções de recuperação enviado"
        redirect_to login_path
    else
      flash.now[:alert] = "usuario não encontrado"
      render "busca"
    end
    end
 end
