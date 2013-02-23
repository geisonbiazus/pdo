# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RespostaDadoDemografico do
  fixtures(:dados_demograficos)

  before(:each) do
    @valid_attributes = {
      :dado_demografico => dados_demograficos(:sexo),
      :alternativa_dado_demografico_id => 1,
      :respostas_pesquisa_id => 1,
      :resposta => "value for resposta"
    }
    @resposta_dado_demografico = RespostaDadoDemografico.new(@valid_attributes)
  end

#  it "should create a new instance given valid attributes" do
#    RespostaDadoDemografico.create!(@valid_attributes)
#  end

  it "deveria validar campos_obrigatórios" do
    @resposta_dado_demografico.dado_demografico_id = nil
    @resposta_dado_demografico.respostas_pesquisa_id = nil
    @resposta_dado_demografico.should have(1).errors_on(:dado_demografico_id)
  end

  it "deveria validar campos resposta e alternativa_dado_demografico_id" do
    @resposta_dado_demografico.alternativa_dado_demografico_id = nil
    @resposta_dado_demografico.resposta = nil

    @resposta_dado_demografico.should have(1).errors_on(:alternativa_dado_demografico_id)
    @resposta_dado_demografico.should have(1).errors_on(:resposta)

    @resposta_dado_demografico.resposta = "nilasfda"

    @resposta_dado_demografico.should have(0).errors_on(:alternativa_dado_demografico_id)
    @resposta_dado_demografico.should have(0).errors_on(:resposta)

    @resposta_dado_demografico.alternativa_dado_demografico_id = 1

    @resposta_dado_demografico.should have(0).errors_on(:alternativa_dado_demografico_id)
    @resposta_dado_demografico.should have(0).errors_on(:resposta)

    @resposta_dado_demografico.dado_demografico.questao_obrigatoria = false
    @resposta_dado_demografico.alternativa_dado_demografico_id = nil
    @resposta_dado_demografico.resposta = nil

    @resposta_dado_demografico.should have(0).errors_on(:alternativa_dado_demografico_id)
    @resposta_dado_demografico.should have(0).errors_on(:resposta)

  end

end
