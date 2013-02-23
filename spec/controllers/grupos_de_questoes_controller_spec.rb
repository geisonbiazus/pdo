require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GruposDeQuestoesController do
  #
  #  def mock_grupo_de_questoes(stubs={})
  #    @mock_grupo_de_questoes ||= mock_model(GrupoDeQuestoes, stubs)
  #  end
  #
  #  describe "GET index" do
  #    it "assigns all grupo_de_questoes as @grupo_de_questoes" do
  #      GrupoDeQuestoes.stub!(:find).with(:all).and_return([mock_grupo_de_questoes])
  #      get :index
  #      assigns[:grupo_de_questoes].should == [mock_grupo_de_questoes]
  #    end
  #  end
  #
  #  describe "GET show" do
  #    it "assigns the requested grupo_de_questoes as @grupo_de_questoes" do
  #      GrupoDeQuestoes.stub!(:find).with("37").and_return(mock_grupo_de_questoes)
  #      get :show, :id => "37"
  #      assigns[:grupo_de_questoes].should equal(mock_grupo_de_questoes)
  #    end
  #  end
  #
  #  describe "GET new" do
  #    it "assigns a new grupo_de_questoes as @grupo_de_questoes" do
  #      GrupoDeQuestoes.stub!(:new).and_return(mock_grupo_de_questoes)
  #      get :new
  #      assigns[:grupo_de_questoes].should equal(mock_grupo_de_questoes)
  #    end
  #  end
  #
  #  describe "GET edit" do
  #    it "assigns the requested grupo_de_questoes as @grupo_de_questoes" do
  #      GrupoDeQuestoes.stub!(:find).with("37").and_return(mock_grupo_de_questoes)
  #      get :edit, :id => "37"
  #      assigns[:grupo_de_questoes].should equal(mock_grupo_de_questoes)
  #    end
  #  end
  #
  #  describe "POST create" do
  #
  #    describe "with valid params" do
  #      it "assigns a newly created grupo_de_questoes as @grupo_de_questoes" do
  #        GrupoDeQuestoes.stub!(:new).with({'these' => 'params'}).and_return(mock_grupo_de_questoes(:save => true))
  #        post :create, :grupo_de_questoes => {:these => 'params'}
  #        assigns[:grupo_de_questoes].should equal(mock_grupo_de_questoes)
  #      end
  #
  #      it "redirects to the created grupo_de_questoes" do
  #        GrupoDeQuestoes.stub!(:new).and_return(mock_grupo_de_questoes(:save => true))
  #        post :create, :grupo_de_questoes => {}
  #        response.should redirect_to(grupo_de_questao_url(mock_grupo_de_questoes))
  #      end
  #    end
  #
  #    describe "with invalid params" do
  #      it "assigns a newly created but unsaved grupo_de_questoes as @grupo_de_questoes" do
  #        GrupoDeQuestoes.stub!(:new).with({'these' => 'params'}).and_return(mock_grupo_de_questoes(:save => false))
  #        post :create, :grupo_de_questoes => {:these => 'params'}
  #        assigns[:grupo_de_questoes].should equal(mock_grupo_de_questoes)
  #      end
  #
  #      it "re-renders the 'new' template" do
  #        GrupoDeQuestoes.stub!(:new).and_return(mock_grupo_de_questoes(:save => false))
  #        post :create, :grupo_de_questoes => {}
  #        response.should render_template('new')
  #      end
  #    end
  #
  #  end
  #
  #  describe "PUT update" do
  #
  #    describe "with valid params" do
  #      it "updates the requested grupo_de_questoes" do
  #        GrupoDeQuestoes.should_receive(:find).with("37").and_return(mock_grupo_de_questoes)
  #        mock_grupo_de_questoes.should_receive(:update_attributes).with({'these' => 'params'})
  #        put :update, :id => "37", :grupo_de_questoes => {:these => 'params'}
  #      end
  #
  #      it "assigns the requested grupo_de_questoes as @grupo_de_questoes" do
  #        GrupoDeQuestoes.stub!(:find).and_return(mock_grupo_de_questoes(:update_attributes => true))
  #        put :update, :id => "1"
  #        assigns[:grupo_de_questoes].should equal(mock_grupo_de_questoes)
  #      end
  #
  #      it "redirects to the grupo_de_questoes" do
  #        GrupoDeQuestoes.stub!(:find).and_return(mock_grupo_de_questoes(:update_attributes => true))
  #        put :update, :id => "1"
  #        response.should redirect_to(grupo_de_questao_url(mock_grupo_de_questoes))
  #      end
  #    end
  #
  #    describe "with invalid params" do
  #      it "updates the requested grupo_de_questoes" do
  #        GrupoDeQuestoes.should_receive(:find).with("37").and_return(mock_grupo_de_questoes)
  #        mock_grupo_de_questoes.should_receive(:update_attributes).with({'these' => 'params'})
  #        put :update, :id => "37", :grupo_de_questoes => {:these => 'params'}
  #      end
  #
  #      it "assigns the grupo_de_questoes as @grupo_de_questoes" do
  #        GrupoDeQuestoes.stub!(:find).and_return(mock_grupo_de_questoes(:update_attributes => false))
  #        put :update, :id => "1"
  #        assigns[:grupo_de_questoes].should equal(mock_grupo_de_questoes)
  #      end
  #
  #      it "re-renders the 'edit' template" do
  #        GrupoDeQuestoes.stub!(:find).and_return(mock_grupo_de_questoes(:update_attributes => false))
  #        put :update, :id => "1"
  #        response.should render_template('edit')
  #      end
  #    end
  #
  #  end
  #
  #  describe "DELETE destroy" do
  #    it "destroys the requested grupo_de_questoes" do
  #      GrupoDeQuestoes.should_receive(:find).with("37").and_return(mock_grupo_de_questoes)
  #      mock_grupo_de_questoes.should_receive(:destroy)
  #      delete :destroy, :id => "37"
  #    end
  #
  #    it "redirects to the grupo_de_questoes list" do
  #      GrupoDeQuestoes.stub!(:find).and_return(mock_grupo_de_questoes(:destroy => true))
  #      delete :destroy, :id => "1"
  #      response.should redirect_to(grupo_de_questoes_url)
  #    end
  #  end

end
