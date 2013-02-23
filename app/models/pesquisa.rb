class Pesquisa < ActiveRecord::Base
  has_many :respostas_pesquisas, :dependent => :destroy
  has_many :dados_demograficos, :dependent => :destroy, :order => 'numero'
  has_many :grupos_de_questoes, :dependent => :destroy

  validates_presence_of :titulo

  def to_label
    titulo
  end

  def gerar_condicao_dados_demograficos(dados)
    return "true" if dados.blank?

    condicao = dados.collect do |dado|
      retorno = "exists (select * from respostas_dados_demograficos "
      retorno += "where respostas_dados_demograficos.respostas_pesquisa_id = respostas_questoes.respostas_pesquisa_id "
      retorno += "and alternativa_dado_demografico_id = #{dado[:alternativa_dado_demografico_id]} and dado_demografico_id = #{dado[:id]})"
      retorno
    end

    condicao.join(" and ")
  end

  def gerar_hash_respostas
    dados = ActiveSupport::OrderedHash.new

    dados_demograficos.each do |dado_demografico|
      dados[dado_demografico.questao] = []

      respostas_pesquisas.each do |respostas_pesquisa|
        resposta = respostas_pesquisa.respostas_dados_demograficos.find_by_dado_demografico_id(dado_demografico.id)
        dados[dado_demografico.questao] << (dado_demografico.tipo == "FECHADA" ? resposta.alternativa_dado_demografico.descricao : resposta.resposta rescue "")
      end
    end
    
    grupos_de_questoes.each do |grupo|
      grupo.questoes.each do |questao|
        dados[questao.descricao] = []

        respostas_pesquisas.each do |respostas_pesquisa|
          resposta = respostas_pesquisa.respostas_questoes.find_by_questao_id(questao.id)

          dados[questao.descricao] << (grupo.tipo == "FECHADAS" ? resposta.alternativa.descricao : resposta.resposta rescue "")
        end
      end
    end
    dados
  end

end
