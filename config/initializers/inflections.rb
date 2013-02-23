# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|

  inflect.irregular "questao", "questoes"
  inflect.irregular "questão", "questões"

  inflect.irregular "RespostaQuestao", "RespostasQuestoes"
  inflect.irregular "resposta_questao", "respostas_questoes"

  inflect.irregular "DadoDemografico", "DadosDemograficos"
  inflect.irregular "dado_demografico", "dados_demograficos"

  inflect.irregular "RespostaDadoDemografico", "RespostasDadosDemograficos"
  inflect.irregular "resposta_dado_demografico", "respostas_dados_demograficos"

  inflect.irregular "AlternativaDadoDemografico", "AlternativasDadosDemograficos"
  inflect.irregular "alternativa_dado_demografico", "alternativas_dados_demograficos"

  inflect.irregular "GrupoDeQuestoes", "GruposDeQuestoes"
  inflect.irregular "GrupoDeQuestões", "GruposDeQuestões"
  inflect.irregular "grupo_de_questoes", "grupos_de_questoes"

  inflect.irregular "pesquisa_respostas", "pesquisas_respostas"
  inflect.irregular "RespostasPesquisa", "RespostasPesquisas"

  #   inflect.plural /^(ox)$/i, '\1en'
  #   inflect.singular /^(ox)en/i, '\1'
  #   inflect.irregular 'person', 'people'
  #   inflect.uncountable %w( fish sheep )
end
