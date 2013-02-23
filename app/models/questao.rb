# -*- encoding : utf-8 -*-
class Questao < ActiveRecord::Base
  belongs_to :grupo_de_questoes
  has_many :respostas_questoes

  validates_presence_of :descricao, :grupo_de_questoes
  validates_numericality_of :numero

  def to_label
    descricao
  end

  def initialize(attributes = nil)
    super(attributes)
    self.questao_obrigatoria = true
  end

end
