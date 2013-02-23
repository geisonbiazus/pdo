# -*- encoding : utf-8 -*-
class GrupoDeQuestoes < ActiveRecord::Base
  has_many :alternativas, :dependent => :destroy, :order => 'numero'
  has_many :questoes, :dependent => :destroy, :order => 'numero'
  belongs_to :pesquisa
  
  validates_presence_of :descricao, :pesquisa
  validates_presence_of :alternativas, :if => Proc.new { |grupo| grupo.tipo == "FECHADAS"}
  validates_inclusion_of :tipo, :in => %w(ABERTAS FECHADAS)

  def to_label
    descricao
  end
end
