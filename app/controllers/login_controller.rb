class LoginController < ApplicationController

  def logar
    usuario = Usuario.logar(params[:usuario][:usuario], params[:usuario][:senha])

    if usuario
      session[:usuario] = usuario.id
      redirect_to :controller => 'pesquisas'
    else
      flash[:error] = "Usuário e/ou senha inválidos"
      render :action => 'index'
    end
  end

  def sair
    session[:usuario] = nil
    redirect_to :controller => 'login'
  end
  
end
