# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AlternativaDadoDemografico do
  fixtures :dados_demograficos, :alternativas_dados_demograficos

  before(:each) do
    @valid_attributes = {
      :dado_demografico => dados_demograficos(:sexo),
      :descricao => "Masculino",
      :numero => 1
    }

    @alternativa = AlternativaDadoDemografico.new(@valid_attributes)
  end

  it "deveria criar uma nova instancia com os atributos validos" do
    AlternativaDadoDemografico.create!(@valid_attributes)
  end

  it "deveria validar descricao obrigatoria" do
    @alternativa.descricao = nil
    @alternativa.should have(1).errors_on(:descricao)
  end

  it "deveria retornar descricao no metod to_label" do
    @alternativa.to_label.should equal @alternativa.descricao
  end
end
