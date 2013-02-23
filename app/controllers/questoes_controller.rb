class QuestoesController < ApplicationController
  active_scaffold do |config|
    config.columns = [:numero, :descricao, :questao_obrigatoria]
    config.columns[:descricao].options = {:rows => 4, :cols => 48}
    config.columns[:questao_obrigatoria].label = "Questão Obrigatória?"
    config.columns[:questao_obrigatoria].form_ui = :checkbox
    config.columns[:questao_obrigatoria].inplace_edit = true
    config.columns[:numero].options = {:size => 3, :maxlength => 4}
  end
end
