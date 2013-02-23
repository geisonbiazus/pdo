# -*- encoding : utf-8 -*-
class GruposDeQuestoesController < ApplicationController
  layout :false

  active_scaffold do |config|
    config.columns = [:pesquisa, :descricao, :tipo, :alternativas, :questoes]
    config.columns[:pesquisa].form_ui = :select
    config.columns[:tipo].label = "Tipo de Questão"
    config.list.columns.exclude :alternativas, :questoes
    config.nested.add_link "Questões", [:questoes]
  end
end
