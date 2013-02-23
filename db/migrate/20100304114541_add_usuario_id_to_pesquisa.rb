# -*- encoding : utf-8 -*-
class AddUsuarioIdToPesquisa < ActiveRecord::Migration
  def self.up
    add_column :pesquisas, :usuario_id, :integer
  end

  def self.down
    remove_column :pesquisas, :usuario_id
  end
end
