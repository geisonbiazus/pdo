require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DadosDemograficosController do

  before(:each) do
    @controller.expects(:verifica_usuario_logado).returns(true).at_least(0)
  end
  
  describe "ACTION create" do
    it "deve apagar os parametros alterativas se o tipo for aberta" do
      post :create, :record => {:tipo => "ABERTA", :alternativas => {"123132" => {:descricao => "lallafsa"}}}

      assigns(:record).alternativas.should be_blank
    end
  end
  describe "ACTION update" do
    it "deve apagar os parametros alterativas se o tipo for aberta" do
      dado_demografico = DadoDemografico.new(:alternativas => [AlternativaDadoDemografico.new])

      DadoDemografico.should_receive(:find).with("1").and_return(dado_demografico)
      post :update, :id => '1', :record => {:tipo => "ABERTA", :alternativas => {"123132" => {:descricao => "lallafsa"}}}

      assigns(:record).alternativas.should be_blank
    end
  end
end
