class DadosDemograficosController < ApplicationController
  active_scaffold do |config|
    config.columns = [:numero, :pesquisa, :questao, :questao_obrigatoria, :tipo, :alternativas]
    config.columns[:numero].options = {:size => 3, :maxlength => 4}
    config.list.columns.exclude :alternativas
    config.columns[:questao].options = {:size => 50}
    config.columns[:tipo].form_ui = :select
    config.columns[:pesquisa].form_ui = :select
    config.columns[:questao_obrigatoria].label = "Questão Obrigatória?"
    config.columns[:questao_obrigatoria].form_ui = :checkbox
    config.columns[:questao_obrigatoria].inplace_edit = true
    #    config.actions.exclude :nested
    config.list.sorting = [{:id => :asc}]
  end

  def create    
    params[:record][:alternativas] = {} if params[:record][:tipo] == "ABERTA"
    super
  end

  def update
    params[:record][:alternativas] = {} if params[:record][:tipo] == "ABERTA"
    super
  end
end
