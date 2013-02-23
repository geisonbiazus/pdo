require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GrupoDeQuestoes do
  fixtures(:pesquisas)

  before(:each) do
    @valid_attributes = {
      :descricao => "Questões",
      :tipo => "ABERTAS",
      :pesquisa => pesquisas(:pesquisa_para_teste)
    }
    @grupo_de_questoes = GrupoDeQuestoes.new(@valid_attributes)
  end

  it "deveria criar uma nova instancia com atributos válidos" do
    GrupoDeQuestoes.create!(@valid_attributes)
  end

  it "deveria retornar descricao no metodo to_label" do
    @grupo_de_questoes.to_label.should equal @grupo_de_questoes.descricao
  end

  it "deve validar alternativas se o tipo for FECHADAS" do
    @grupo_de_questoes.tipo = "FECHADAS"
    @grupo_de_questoes.should have(1).errors_on(:alternativas)
    @grupo_de_questoes.tipo = "ABERTAS"
    @grupo_de_questoes.should have(0).errors_on(:alternativas)
  end
end
