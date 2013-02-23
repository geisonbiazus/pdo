require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DadoDemografico do
  fixtures :pesquisas, :dados_demograficos, :alternativas_dados_demograficos
  
  before(:each) do
    @valid_attributes = {
      :questao => "Cidade",
      :tipo => "ABERTA",
      :pesquisa => pesquisas(:pesquisa_para_teste),
      :numero => 1
    }

    @dado_demografico = DadoDemografico.new(@valid_attributes)
  end

  it "deveria criar uma nova instancia passando atributos válidos" do
    DadoDemografico.create!(@valid_attributes)
  end

  it "deveria validar questao obrigatório" do
    @dado_demografico.questao = nil
    @dado_demografico.should have(1).errors_on(:questao)
    @dado_demografico.questao = "Cidade"
    @dado_demografico.should have(0).errors_on(:questao)
  end

  it "deveria validar tipo somente ABERTA ou FECHADA" do
    @dado_demografico.tipo = nil
    @dado_demografico.should have(1).errors_on(:tipo)
    @dado_demografico.tipo = "FECHADA"
    @dado_demografico.should have(0).errors_on(:tipo)
  end

  it "deveria trazer as alternativas usando o metodo alternativas" do
    dado = dados_demograficos(:sexo)
    dado.alternativas.should have(2).items
  end

  it "deveria validar presença das alternativas se o tipo fosse FECHADA" do
    @dado_demografico.tipo = "FECHADA"
    @dado_demografico.alternativas.clear
    @dado_demografico.should have(1).errors_on(:alternativas)
  end

  it "to_label deveria retornar questao" do
    @dado_demografico.to_label.should equal @dado_demografico.questao
  end

  it "deve inicializar o campo questao_origatoria" do
    dado_demografico = DadoDemografico.new
    dado_demografico.questao_obrigatoria.should equal true
  end
end
