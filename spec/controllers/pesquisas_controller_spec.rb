# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PesquisasController do
  before(:each) do
    @controller.expects(:verifica_usuario_logado).returns(true).at_least(0)
  end

  describe "testes da tabulação das respostas" do

    describe "ACTION tabular_respostas" do
    
      it "deve carregar um objeto @pesquisa" do
        pesquisa = mock_model(Pesquisa)
        Pesquisa.should_receive(:find).and_return(pesquisa)

        post :tabular_respostas, :id => 1

        assigns(:pesquisa).should == pesquisa
      end
    end

    describe "ACTION gerar_relatorio" do
      it "deve enviar um aruivo pdf com a opção de questoes fechadas" do
        post :gerar_pdf, :id => "1", :relatorio => {:tipo_questoes => "FECHADAS"}
        response.should be_success
      end

      it "deve enviar um aruivo pdf com a opção de questoes abertas" do
        post :gerar_pdf, :id => "1", :relatorio => {:tipo_questoes => "ABERTAS"}
        response.should be_success
      end
    end

    describe "ACTION visualizar_respostas" do
      it "deve enviar um aruivo xls" do
        post :visualizar_respostas, :id => "1"
        response.should be_success
      end
    end
  end
end
