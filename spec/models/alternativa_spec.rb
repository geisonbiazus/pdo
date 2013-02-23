# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Alternativa do
  fixtures :grupos_de_questoes
    
  before(:each) do
    @valid_attributes = {
      :grupo_de_questoes => grupos_de_questoes(:grupo_um),
      :descricao => "value for decricao",
      :numero => 1
    }
    @alternativa = Alternativa.new(@valid_attributes)
  end

  it "deveria criar uma nova instancia com atributos válidos" do
    Alternativa.create!(@valid_attributes)
  end

  it "to_label deveria retornar descricao" do
    @alternativa.to_label.should equal @alternativa.descricao
  end
end
