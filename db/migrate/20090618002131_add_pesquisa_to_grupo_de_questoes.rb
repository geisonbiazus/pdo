# -*- encoding : utf-8 -*-
class AddPesquisaToGrupoDeQuestoes < ActiveRecord::Migration
  def self.up
    add_column :grupos_de_questoes, :pesquisa_id, :integer
  end

  def self.down
    remove_column :grupos_de_questoes, :pesquisa_id
  end
end
