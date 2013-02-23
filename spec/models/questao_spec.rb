require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Questao do
  fixtures(:grupos_de_questoes)

  before(:each) do
    @valid_attributes = {
      :descricao => "Texto da descricao",
      :grupo_de_questoes => grupos_de_questoes(:grupo_um),
      :numero => 1
    }
    @questao = Questao.new(@valid_attributes)
  end

  it "deveria criar uma nova intancia do objeto passando atributos válidos" do
    Questao.create!(@valid_attributes)
  end

  it "to_label deveria retornar descricao" do
    @questao.to_label.should equal @questao.descricao
  end

  it "deve inicializar o campo questao_origatoria" do
    questao = Questao.new
    questao.questao_obrigatoria.should equal true
  end
end
