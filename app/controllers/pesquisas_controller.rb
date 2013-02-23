class PesquisasController < ApplicationController
  include RelatoriosHelper

  active_scaffold do |config|
    config.columns = [:titulo, :texto_introdutorio]
    config.columns[:texto_introdutorio].options = {:rows => 4, :cols => 48}
    config.columns[:titulo].options = {:size => 50}
    config.list.columns.exclude :texto_introdutorio

    config.action_links.add "Visualizar Questionário", 
      :label => "Visualizar Questionário",
      :popup => true,
      :controller => "questionarios", 
      :action => "visualizar_questionario",
      :type => :record

    config.action_links.add "Visualizar Respostas",
      :label => "Visualizar Respostas",
      :action => "tabular_respostas",
      :inline => true,
      :type => :record
    
    config.nested.add_link "Dados Demográficos", [:dados_demograficos]
    config.nested.add_link "Grupos de Questões", [:grupos_de_questoes]
  end

  def tabular_respostas
    @pesquisa = Pesquisa.find params[:id]
    
    render :partial => "tabular_respostas"
  end

  def visualizar_respostas
    @pesquisa = Pesquisa.find params[:id]

    enviar_relatorio_xls('respostas_pesquisa', @pesquisa.gerar_hash_respostas)
  end

  def gerar_pdf
    pesquisa = Pesquisa.find params[:id]

    dados = (params[:relatorio][:dados_demograficos].values rescue []).find_all {|dado| not dado[:alternativa_dado_demografico_id].blank?}
    
    condicao_dados_demograficos = pesquisa.gerar_condicao_dados_demograficos(dados)

    if params[:relatorio][:tipo_questoes] == "FECHADAS"
      enviar_relatorio({:nome_relatorio => "tabulacao_questoes_fechadas", :pesquisa_id => params[:id], :condicao_dados_demograficos => condicao_dados_demograficos})
    else
      enviar_relatorio({:nome_relatorio => "listagem_questoes_abertas", :pesquisa_id => params[:id], :condicao_dados_demograficos => condicao_dados_demograficos})
    end
  end

  def before_create_save(record)
    record.usuario_id = session[:usuario]
  end

  def conditions_for_collection
    ["usuario_id = ?", session[:usuario]]
  end
end
