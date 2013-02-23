# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RespostaQuestao do
  fixtures :questoes
  
  before(:each) do

    @valid_attributes = {
      :questao => questoes(:questao_teste),
      :alternativa_id => 1,
      :respostas_pesquisa_id => 1,
      :resposta => "value for resposta"
    }
    @resposta_questao = RespostaQuestao.new(@valid_attributes)
  end
#
#  it "should create a new instance given valid attributes" do
#    RespostaQuestao.create!(@valid_attributes)
#  end

  it "deveria validar campos_obrigatórios" do
    @resposta_questao.questao_id = nil
    @resposta_questao.respostas_pesquisa_id = nil
    @resposta_questao.should have(1).errors_on(:questao_id)
  end

  it "deveria validar campos resposta e alternativa_questao_id" do

    @resposta_questao.alternativa_id = nil
    @resposta_questao.resposta = nil

    @resposta_questao.should have(1).errors_on(:alternativa_id)
    @resposta_questao.should have(1).errors_on(:resposta)

    @resposta_questao.resposta = "nilasfda"

    @resposta_questao.should have(0).errors_on(:alternativa_id)
    @resposta_questao.should have(0).errors_on(:resposta)

    @resposta_questao.alternativa_id = 1

    @resposta_questao.should have(0).errors_on(:alternativa_id)
    @resposta_questao.should have(0).errors_on(:resposta)


    @resposta_questao.questao.questao_obrigatoria = false
    @resposta_questao.alternativa_id = nil
    @resposta_questao.resposta = nil
    
    @resposta_questao.should have(0).errors_on(:alternativa_id)
    @resposta_questao.should have(0).errors_on(:resposta)
  end
end
