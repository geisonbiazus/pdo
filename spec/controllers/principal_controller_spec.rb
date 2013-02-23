# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PrincipalController do

  before(:each) do
    @controller.expects(:verifica_usuario_logado).returns(true).at_least(0)
  end
  
  #Delete this example and add some real ones
  it "should use PrincipalController" do
    controller.should be_an_instance_of(PrincipalController)
  end

end
