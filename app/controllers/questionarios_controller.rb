# -*- encoding : utf-8 -*-
class QuestionariosController < ApplicationController

  def index
    render :action => 'questionario'
  end

  def visualizar_questionario
    @pesquisa = Pesquisa.find(params[:id])
    @respostas_pesquisa = RespostasPesquisa.new(:pesquisa => @pesquisa)
    render :action => 'questionario'
  end

  def responder_questionario
    @pesquisa = Pesquisa.find(params[:id])
    @respostas_pesquisa = RespostasPesquisa.new(:pesquisa => @pesquisa)

    if params[:dados_demograficos]
      params[:dados_demograficos].each_value do |resposta|
        @respostas_pesquisa.respostas_dados_demograficos << RespostaDadoDemografico.new(resposta)
      end
    end

    if params[:questoes]
      params[:questoes].each_value do |resposta|
        @respostas_pesquisa.respostas_questoes << RespostaQuestao.new(resposta)
      end
    end

    if @respostas_pesquisa.save
      render :action => "questionario_respondido"
    else
      @pesquisa.errors.add_to_base("Algumas questões obrigatórias não foram respondidas")
      render :action => "questionario"
    end
  end
end
