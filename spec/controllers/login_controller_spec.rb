# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LoginController do
  fixtures :usuarios

  #Delete this example and add some real ones
  it "should use LoginController" do
    controller.should be_an_instance_of(LoginController)
  end

  it "deve redirecionar para login ao acessar uma action sem logar" do
    @controller = PesquisasController.new

    put :index

    response.should redirect_to :controller => 'login'
  end

  describe "ACTION logar" do
    describe "com usuario e senha correto" do
      before(:each) do        
        post :logar, :usuario => {:usuario => 'teste', :senha => 'teste'}
      end

      it "deve gravar o id do usuario na session" do
        session[:usuario].should == 1
      end

      it "deve redirecionar para o controller pesquisas" do
        response.should redirect_to :controller => 'pesquisas'
      end
    end

    describe 'com usuario e senha incorretos' do
      before(:each) do
        post :logar, :usuario => {:usuario => 'usuario_incorreto', :senha => 'senha_incorreta'}
      end

      it "deve renderizar novamente a tela de login contendo a mensagem de usuario invalido no flash" do
        response.should render_template 'index'
        flash[:error].should == "Usuário e/ou senha inválidos"
      end
    end
  end

  it "action sair deve redirecionar par aa tela de login e limpar o usuario da session" do
    put :sair

    session[:usuario].should be_nil
    response.should redirect_to :controller => 'login'
  end

end
