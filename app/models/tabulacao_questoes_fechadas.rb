# -*- encoding : utf-8 -*-
class TabulacaoQuestoesFechadas < ActiveRecord::Base
  set_table_name "tabulacao_questoes_fechadas"

  belongs_to :pesquisa
  belongs_to :grupo_de_questoes
  belongs_to :alternativa
  belongs_to :questao
end
