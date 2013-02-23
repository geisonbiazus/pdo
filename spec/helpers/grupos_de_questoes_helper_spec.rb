# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GruposDeQuestoesHelper do
  include GruposDeQuestoesHelper

  #Delete this example and add some real ones or delete this file
  it "is included in the helper object" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(GruposDeQuestoesHelper)
  end

  it "tipo_form_column deve retornar um html contendo inputs" do
    retorno = tipo_form_column(GrupoDeQuestoes.new, 'nome_do_campo')
    retorno.include?("input").should be(true)
  end

  it "tipo_column deve retornar campo tipo com humanize" do
    tipo_column(GrupoDeQuestoes.new(:tipo => "ABERTA")).should == "Aberta"
  end
  
end
