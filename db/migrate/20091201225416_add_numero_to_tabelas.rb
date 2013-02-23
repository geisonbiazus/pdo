# -*- encoding : utf-8 -*-
class AddNumeroToTabelas < ActiveRecord::Migration
  def self.up
    add_column :questoes, :numero, :integer
    add_column :alternativas, :numero, :integer
    add_column :dados_demograficos, :numero, :integer
    add_column :alternativas_dados_demograficos, :numero, :integer
  end

  def self.down
    remove_column :questoes, :numero
    remove_column :alternativas, :numero
    remove_column :dados_demograficos, :numero
    remove_column :alternativas_dados_demograficos, :numero
  end
end
