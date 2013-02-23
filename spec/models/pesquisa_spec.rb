require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Pesquisa do
  fixtures(:all)

  before(:each) do
    @atributos_validos = {
      :titulo => "Título da pesquisa",
      :texto_introdutorio => "introdução da pesquisa"
    }

    @pesquisa = Pesquisa.new(@atributos_validos)
  end

  it "deveria gravar pesquisa com os atributos válidos" do
    @pesquisa.attributes = @atributos_validos
    @pesquisa.save.should be true
  end

  it "deveria validar presença do campo título" do
    @pesquisa.titulo = nil
    @pesquisa.valid?
    @pesquisa.should have(1).errors_on(:titulo)
  end

  it "to_label deveria retornar titulo" do
    @pesquisa.to_label.should equal @pesquisa.titulo
  end

  it "gerar_condicao_dados_demograficos deve retornar uma string com as condições sql que serão utilizadas na tabulação" do
    dados = []
    dados << {:alternativa_dado_demografico_id => "5", :id => "1"}
    dados << {:alternativa_dado_demografico_id => "8", :id => "2"}
    dados << {:alternativa_dado_demografico_id => "10", :id => "3"}

    retorno = "exists (select * from respostas_dados_demograficos "
    retorno += "where respostas_dados_demograficos.respostas_pesquisa_id = respostas_questoes.respostas_pesquisa_id "
    retorno += "and alternativa_dado_demografico_id = 5 and dado_demografico_id = 1) "
    retorno += "and exists (select * from respostas_dados_demograficos "
    retorno += "where respostas_dados_demograficos.respostas_pesquisa_id = respostas_questoes.respostas_pesquisa_id "
    retorno += "and alternativa_dado_demografico_id = 8 and dado_demografico_id = 2) "
    retorno += "and exists (select * from respostas_dados_demograficos "
    retorno += "where respostas_dados_demograficos.respostas_pesquisa_id = respostas_questoes.respostas_pesquisa_id "
    retorno += "and alternativa_dado_demografico_id = 10 and dado_demografico_id = 3)"

    @pesquisa.gerar_condicao_dados_demograficos(dados).should == retorno
  end

  it "gerar_condicao_dados_demograficos deve retornar uma string com true se nenhum dado for passado" do
    @pesquisa.gerar_condicao_dados_demograficos([]).should == "true"
  end

  describe 'testes exportar_respostas' do
    before(:each) do
      @pesquisa_exportacao = Pesquisa.find 1    
    end

    it "gerar_hash_respostas deveria retornar os dados corretos" do
      dados = @pesquisa_exportacao.gerar_hash_respostas

      dados.should be_a(ActiveSupport::OrderedHash)

      questoes = ["Sexo", "Cidade", "Questao Teste", "Questao Teste 2" , "Questao Teste 3"]
      respostas = ["Masculino", "Francisco Beltrão", "Ruim", "Ruim", "Teste"]

      dados.keys.should == questoes

      questoes.each_with_index do |questao, index|
        dados[questao].should have(100).items
        dados[questao].first.should == respostas[index]
      end
    end
  end

end
