# -*- encoding : utf-8 -*-
class Alternativa < ActiveRecord::Base
  belongs_to :grupo_de_questoes

  validates_presence_of :descricao
  validates_numericality_of :numero

  def to_label
    descricao
  end

end
