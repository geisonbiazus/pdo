# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QuestionariosController do

  before(:each) do
    @controller.expects(:verifica_usuario_logado).returns(true).at_least(0)
  end

  #Delete this example and add some real ones
  it "should use QuestionariosController" do
    controller.should be_an_instance_of(QuestionariosController)
  end

  describe "ACTION index" do
    it "deve renderizar template index" do
      get :index
      response.should render_template('questionario')
    end
  end

  describe "ACTION viasualizar_questionario" do
    it "deve receber um parametro com o id da pesquisa e retornar um objeto @pesquisa" do
      mock_pesquisa = mock_model(Pesquisa)

      Pesquisa.should_receive(:find).and_return(mock_pesquisa)

      get :visualizar_questionario, :id => 1
      assert_equal mock_pesquisa, assigns(:pesquisa)
    end
  end

  describe "ACTION responder_questionario" do
    describe "respondendo todas as questoes" do
      before(:each) do
        Pesquisa.should_receive(:find).with("1").and_return(Pesquisa.new)
        RespostasPesquisa.any_instance.expects(:save).returns(true)

        dados_demograficos = {}
        dados_demograficos["1"] = {:dado_demografico_id => "1", :resposta => "Resposta Teste"}
        dados_demograficos["2"] = {:dado_demografico_id => "2", :alternativa_dado_demografico_id => "2"}

        questoes = {}
        questoes["1"] = {:questao_id => "1", :resposta => "Resposta teste"}
        questoes["2"] = {:questao_id => "2", :alternativa_id => "4"}
        questoes["3"] = {:questao_id => "3", :alternativa_id => "1"}

        get :responder_questionario, :id => 1, :dados_demograficos => dados_demograficos, :questoes => questoes
      end

      it "deve retornar um objeto @respostas_pesquisa com um obejro pesquisa vinculado" do
        assigns(:respostas_pesquisa).pesquisa.should be_an_instance_of(Pesquisa)
      end

      it "deve atribuir ao objeto @respostas_pesquisa as respostas dos dados demograficos" do
        assigns(:respostas_pesquisa).respostas_dados_demograficos.should have(2).items        
      end

      it "deve atribuir ao objeto @respostas_pesquisa as respostas das questoes" do
        assigns(:respostas_pesquisa).respostas_questoes.should have(3).items
      end

      it "deve rederizar a template questionario respondido" do
        response.should render_template("questionario_respondido")
      end
    end

    describe "sem responder todas as questoes" do
      it "deve renderizar a template questionario novamente e deve ter objetos invalidos" do
        Pesquisa.should_receive(:find).with("1").and_return(Pesquisa.new)
        RespostaDadoDemografico.any_instance.expects(:dado_demografico).returns(DadoDemografico.new(:questao_obrigatoria => "true")).at_least_once
        RespostaQuestao.any_instance.expects(:questao).returns(Questao.new(:questao_obrigatoria => "true")).at_least_once

        dados_demograficos = {}
        dados_demograficos["1"] = {:dado_demografico_id => "1", :resposta => ""}
        dados_demograficos["2"] = {:dado_demografico_id => "2", :alternativa_dado_demografico_id => ""}

        questoes = {}
        questoes["1"] = {:questao_id => "1", :resposta => ""}
        questoes["2"] = {:questao_id => "2", :alternativa_id => ""}
        questoes["3"] = {:questao_id => "3", :alternativa_id => "1"}

        get :responder_questionario, :id => 1, :dados_demograficos => dados_demograficos, :questoes => questoes
        assigns(:respostas_pesquisa).should have(2).errors_on(:respostas_dados_demograficos)
        assigns(:respostas_pesquisa).should have(2).errors_on(:respostas_questoes)
        response.should render_template("questionario")
      end
    end
  end
end
