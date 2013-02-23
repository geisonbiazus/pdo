class RespostaQuestao < ActiveRecord::Base
  belongs_to :questao
  belongs_to :alternativa
  belongs_to :respostas_pesquisa

  validates_presence_of :questao_id
  validates_presence_of :alternativa_id, :if => Proc.new {|r| r.resposta.blank? && (r.questao.questao_obrigatoria? rescue false)}
  validates_presence_of :resposta, :if => Proc.new {|r| r.alternativa_id.blank? && (r.questao.questao_obrigatoria? rescue false)}
end
