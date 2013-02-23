class AlternativasDadosDemograficosController < ApplicationController
  active_scaffold do |config|
    config.columns = [:numero, :descricao]
    config.columns[:numero].options = {:size => 3, :maxlength => 4}
    config.columns[:descricao].label = "Descrição"
    config.list.columns.add :id
  end
end
