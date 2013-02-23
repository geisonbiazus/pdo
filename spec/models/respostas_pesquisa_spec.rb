# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RespostasPesquisa do
  before(:each) do
    @valid_attributes = {
      :pesquisa_id => 1
    }
    @respostas_pesquisa = RespostasPesquisa.new(@valid_attributes)
  end

#  it "should create a new instance given valid attributes" do
#    RespostasPesquisa.create!(@valid_attributes)
#  end

  it "deveria validar pesquisa_id"do
    @respostas_pesquisa.pesquisa_id = nil
    @respostas_pesquisa.should have(1).errors_on(:pesquisa_id)
  end

end
