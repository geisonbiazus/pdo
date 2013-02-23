# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Usuario do
  fixtures :usuarios

  before(:each) do
    @valid_attributes = {
      :usuario => 'teste_2',
      :senha => 'teste',
      :senha_confirmation => 'teste'
    }
  end

  it "should create a new instance given valid attributes" do
    Usuario.create!(@valid_attributes)
  end

  it "to_label deve retornar nome do usuario" do
    usuario = Usuario.new @valid_attributes
    usuario.to_label.should == usuario.usuario
  end

  it "logar com atributos validos deve retornar um obejro usuario" do
    usuario = Usuario.logar('teste', 'teste')

    usuario.should_not be_nil
  end

end
