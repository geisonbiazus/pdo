class RespostaDadoDemografico < ActiveRecord::Base
  belongs_to :dado_demografico
  belongs_to :alternativa_dado_demografico
  belongs_to :respostas_pesquisa

  validates_presence_of :dado_demografico_id
  validates_presence_of :alternativa_dado_demografico_id, :if => Proc.new {|r| r.resposta.blank?  && (r.dado_demografico.questao_obrigatoria? rescue false)}
  validates_presence_of :resposta, :if => Proc.new {|r| r.alternativa_dado_demografico_id.blank? && (r.dado_demografico.questao_obrigatoria? rescue false)}
end
