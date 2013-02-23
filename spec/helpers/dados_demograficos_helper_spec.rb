# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DadosDemograficosHelper do

  include DadosDemograficosHelper
  
  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(DadosDemograficosHelper)
  end

  it "tipo_form_column deve retornar uma string com os tipos" do
    tipo_form_column(DadoDemografico.new, "teste").should be_a(String)
  end

  it "tipo_column deve retornar uma string com os tipos" do
    tipo_column(DadoDemografico.new(:tipo => "ABERTA")).should be_a(String)
  end

end
