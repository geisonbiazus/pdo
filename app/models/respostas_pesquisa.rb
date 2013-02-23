class RespostasPesquisa < ActiveRecord::Base
  has_many :respostas_dados_demograficos, :dependent => :destroy
  has_many :respostas_questoes, :dependent => :destroy

  belongs_to :pesquisa
  validates_presence_of :pesquisa_id
end
