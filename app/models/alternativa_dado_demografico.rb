class AlternativaDadoDemografico < ActiveRecord::Base
  belongs_to :dado_demografico

  validates_presence_of :descricao
  validates_numericality_of :numero
  
  def to_label
    descricao
  end
end
