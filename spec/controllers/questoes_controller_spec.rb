# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QuestoesController do
#
#  def mock_questao(stubs={})
#    @mock_questao ||= mock_model(Questao, stubs)
#  end
#
#  describe "GET index" do
#    it "assigns all questoes as @questoes" do
#      Questao.stub!(:find).with(:all).and_return([mock_questao])
#      get :index
#      assigns[:questoes].should == [mock_questao]
#    end
#  end
#
#  describe "GET show" do
#    it "assigns the requested questao as @questao" do
#      Questao.stub!(:find).with("37").and_return(mock_questao)
#      get :show, :id => "37"
#      assigns[:questao].should equal(mock_questao)
#    end
#  end
#
#  describe "GET new" do
#    it "assigns a new questao as @questao" do
#      Questao.stub!(:new).and_return(mock_questao)
#      get :new
#      assigns[:questao].should equal(mock_questao)
#    end
#  end
#
#  describe "GET edit" do
#    it "assigns the requested questao as @questao" do
#      Questao.stub!(:find).with("37").and_return(mock_questao)
#      get :edit, :id => "37"
#      assigns[:questao].should equal(mock_questao)
#    end
#  end
#
#  describe "POST create" do
#
#    describe "with valid params" do
#      it "assigns a newly created questao as @questao" do
#        Questao.stub!(:new).with({'these' => 'params'}).and_return(mock_questao(:save => true))
#        post :create, :questao => {:these => 'params'}
#        assigns[:questao].should equal(mock_questao)
#      end
#
#      it "redirects to the created questao" do
#        Questao.stub!(:new).and_return(mock_questao(:save => true))
#        post :create, :questao => {}
#        response.should redirect_to(questao_url(mock_questao))
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns a newly created but unsaved questao as @questao" do
#        Questao.stub!(:new).with({'these' => 'params'}).and_return(mock_questao(:save => false))
#        post :create, :questao => {:these => 'params'}
#        assigns[:questao].should equal(mock_questao)
#      end
#
#      it "re-renders the 'new' template" do
#        Questao.stub!(:new).and_return(mock_questao(:save => false))
#        post :create, :questao => {}
#        response.should render_template('new')
#      end
#    end
#
#  end
#
#  describe "PUT update" do
#
#    describe "with valid params" do
#      it "updates the requested questao" do
#        Questao.should_receive(:find).with("37").and_return(mock_questao)
#        mock_questao.should_receive(:update_attributes).with({'these' => 'params'})
#        put :update, :id => "37", :questao => {:these => 'params'}
#      end
#
#      it "assigns the requested questao as @questao" do
#        Questao.stub!(:find).and_return(mock_questao(:update_attributes => true))
#        put :update, :id => "1"
#        assigns[:questao].should equal(mock_questao)
#      end
#
#      it "redirects to the questao" do
#        Questao.stub!(:find).and_return(mock_questao(:update_attributes => true))
#        put :update, :id => "1"
#        response.should redirect_to(questao_url(mock_questao))
#      end
#    end
#
#    describe "with invalid params" do
#      it "updates the requested questao" do
#        Questao.should_receive(:find).with("37").and_return(mock_questao)
#        mock_questao.should_receive(:update_attributes).with({'these' => 'params'})
#        put :update, :id => "37", :questao => {:these => 'params'}
#      end
#
#      it "assigns the questao as @questao" do
#        Questao.stub!(:find).and_return(mock_questao(:update_attributes => false))
#        put :update, :id => "1"
#        assigns[:questao].should equal(mock_questao)
#      end
#
#      it "re-renders the 'edit' template" do
#        Questao.stub!(:find).and_return(mock_questao(:update_attributes => false))
#        put :update, :id => "1"
#        response.should render_template('edit')
#      end
#    end
#
#  end
#
#  describe "DELETE destroy" do
#    it "destroys the requested questao" do
#      Questao.should_receive(:find).with("37").and_return(mock_questao)
#      mock_questao.should_receive(:destroy)
#      delete :destroy, :id => "37"
#    end
#
#    it "redirects to the questoes list" do
#      Questao.stub!(:find).and_return(mock_questao(:destroy => true))
#      delete :destroy, :id => "1"
#      response.should redirect_to(questoes_url)
#    end
#  end
#
end
