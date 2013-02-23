# -*- encoding : utf-8 -*-
class DadoDemografico < ActiveRecord::Base
  belongs_to :pesquisa
  has_many :alternativas, :class_name => AlternativaDadoDemografico.name, :dependent => :destroy, :order => 'numero'
  has_many :respostas_dados_demograficos

  validates_presence_of :questao
  validates_numericality_of :numero
  validates_presence_of :alternativas, :if => Proc.new {|dado_demografico| dado_demografico.tipo == "FECHADA"}
  validates_inclusion_of :tipo, :in => %w(ABERTA FECHADA)

  def to_label
    questao
  end

  def initialize(attributes = nil)
    super(attributes)
    self.questao_obrigatoria = true
  end

end
